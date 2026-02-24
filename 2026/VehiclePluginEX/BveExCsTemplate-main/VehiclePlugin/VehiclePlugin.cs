using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;
using BveEx.Extensions.Native;
using BveEx.PluginHost.Plugins;
using BveTypes.ClassWrappers;

namespace MetroDriverEX.Vehicles
{
    [Plugin(PluginType.VehiclePlugin)]
    internal class VehiclePluginMain : AssemblyPluginBase
    {
        INative native;
        int KeyIndex;//マスコンキーのindex(メトロ総合プラグイン互換)
        int AtcState = 0;//ATC指示速度
        bool isAtcMoved;//ATCブレーキ作動中？
        StationStore stationStore;

        public VehiclePluginMain(PluginBuilder builder) : base(builder)
        {
            native = Extensions.GetExtension<INative>();
            
            BveHacker.ScenarioCreated += BveHacker_ScenarioCreated;
        }

        private void BveHacker_ScenarioCreated(BveEx.PluginHost.ScenarioCreatedEventArgs e)
        {
            stationStore = ReadFiles.ReadStations(BveHacker.ScenarioInfo.FileName,BveHacker.ScenarioInfo.RouteTitle);
        }

        public override void Dispose()
        {
            BveHacker.ScenarioCreated -= BveHacker_ScenarioCreated;
        }

        public override void Tick(TimeSpan elapsed)
        {
            //マスコンキーの確認・atc指示速度の読み取り(メトロ総合プラグイン必須)
            List<int> atsArray = (List<int>)native.AtsPanelArray;
            KeyIndex = native.AtsPanelArray[92];//マスコンキーのindex(メトロ総合プラグイン互換) 0切 1営団 2東武 3東急 4西武 6国鉄 8東陽
            if (KeyIndex == 1)//ATC 営団
            {
                for(int i = 101; i<=131;i++) //メトロ総合プラグイン参照 101(✕) 102 (0) 104 (10km) ~ 125(120km)
                {
                    if (atsArray[i] == 1)
                    {
                        if (i == 101 || i == 102 || i == 131) AtcState = 0;
                        else if (i == 125) AtcState = 120;
                        else if(i<=124 && i>= 104) AtcState = (i - 104) * 5 +10;
                    }
                }
            }
            //ATC作動中かどうか
            if (AtcState + 2 < native.VehicleState.Speed)//体感指示速度+120ぐらいで動いてるパターンが多かったかも？
            {
                isAtcMoved = true;
            }
            else isAtcMoved = false;

            //256番 ~ 261　現在時刻(digitalnumber型)
            string current = BveHacker.Scenario.TimeManager.Time.ToString("hhmmss");
            native.AtsPanelArray[256] = int.Parse(current.Substring(0,1));//h 1
            native.AtsPanelArray[257] = int.Parse(current.Substring(1, 2));//h 2
            native.AtsPanelArray[258] = int.Parse(current.Substring(2, 3));//m 1
            native.AtsPanelArray[259] = int.Parse(current.Substring(3, 4));//m 2
            native.AtsPanelArray[260] = int.Parse(current.Substring(4, 5));//s 1
            native.AtsPanelArray[261] = int.Parse(current.Substring(5, 6));//s 2
            //262 ~  267 到着時刻(digitalnumber型)
            int index = BveHacker.Scenario.Map.Stations.CurrentIndex + 1;
            Station sta = null;
            try
            {
                sta = (Station)BveHacker.Scenario.Map.Stations[index];
            }
            catch(Exception e)
            {
                MessageBox.Show("sta_indexがnull也\n"+e.Message);
                sta = (Station)BveHacker.Scenario.Map.Stations[index-1];
            }
            string next = "000000";
            try
            {
               if(sta.Pass) next = sta.DepartureTime.ToString("hhmmss");
               else next = sta.ArrivalTime.ToString("hhmmss");
            }
            catch { }
            native.AtsPanelArray[262] = int.Parse(next.Substring(0, 1));//h 1
            native.AtsPanelArray[263] = int.Parse(next.Substring(1, 2));//h 2
            native.AtsPanelArray[264] = int.Parse(next.Substring(2, 3));//m 1
            native.AtsPanelArray[265] = int.Parse(next.Substring(3, 4));//m 2
            native.AtsPanelArray[266] = int.Parse(next.Substring(4, 5));//s 1
            native.AtsPanelArray[267] = int.Parse(next.Substring(5, 6));//s 2
            //268 ~ 271 次駅距離(digitalnumber)
            int nextLoc = Math.Abs((int)(sta.Location - BveHacker.Scenario.VehicleLocation.Location));
            native.AtsPanelArray[268] = (nextLoc / 1000) % 10;
            native.AtsPanelArray[269] = (nextLoc / 100) % 10;
            native.AtsPanelArray[270] = (nextLoc / 10) % 10;
            native.AtsPanelArray[271] = nextLoc % 10;
            //272 ~ 274 残り時刻(digitalnumber)
            int remainTime = Math.Abs((int)(sta.ArrivalTime - BveHacker.Scenario.TimeManager.Time).TotalSeconds);
            native.AtsPanelArray[272] = (remainTime / 100) % 10;
            native.AtsPanelArray[273] = (remainTime / 10) % 10;
            native.AtsPanelArray[274] = remainTime % 10;
            //275 ~ 277 ATC指示速度(digitalnumber)
            native.AtsPanelArray[275] = (AtcState / 100) % 10;
            native.AtsPanelArray[276] = (AtcState / 10) % 10;
            native.AtsPanelArray[277] = AtcState % 10;
            //278 ~ 281 ノッチ情報(digitalnumber) =>「P」「B」は普通にpilotlumpでもOK 20000系列専用？
            if (!(KeyIndex == 0))
            {
                native.AtsPanelArray[278] = 1; //P
                if (isAtcMoved) native.AtsPanelArray[279] = 6;//Power段数 画像0段目 => 何もなし　1~5段目:0~4に対応 6段目:-(atc作動時)
                else native.AtsPanelArray[279] = BveHacker.Scenario.Vehicle.Instruments.Cab.Handles.PowerNotch+1;
                native.AtsPanelArray[280] = 1; //B
                if (isAtcMoved) native.AtsPanelArray[281] = 11;//Brake段数 画像0段目 => 何もなし　1~10段目:0~EBに対応 11段目:-(atc作動時)
                else native.AtsPanelArray[281] = BveHacker.Scenario.Vehicle.Instruments.Cab.Handles.BrakeNotch + 1;
            }
            else
            {
                native.AtsPanelArray[278] = 0;
                native.AtsPanelArray[279] = 0;
                native.AtsPanelArray[280] = 0;
                native.AtsPanelArray[281] = 0;
            }
            //282 次駅(digitalnumber) => 13000/700000系列？ 0:無表示 1:北千住車庫 2:北千住 ... 11 茅場町
            if(!(sta == null))
            {
                Station nextStopSta; 
                int tmp_staIndex = BveHacker.Scenario.Map.Stations.CurrentIndex + 1;
                while (true)
                {
                    try
                    {
                        nextStopSta = (Station)BveHacker.Scenario.Map.Stations[tmp_staIndex];
                        if (!nextStopSta.Pass) break;
                        tmp_staIndex++;
                    }
                    catch
                    {
                        nextStopSta = (Station)BveHacker.Scenario.Map.Stations[tmp_staIndex-1];
                    }
                }
                
            }
        }
    }
    class ReadFiles
    {
        static internal StationStore ReadStations(string ScenarioLocation,string RouteTitle)//(scenarios\)wattzmaro\settings\Title\stationlist.txt
        {
            string path = Path.Combine(Path.GetDirectoryName(ScenarioLocation), @"../wattzmaro\settings",RouteTitle,"StationList.txt");//Map作者側

            StationStore st = new StationStore();
            using (StreamReader sr = new StreamReader(path))
            {
                string containts = sr.ReadToEnd();
                string[] lines = containts.Split(',');
                List<String> temp = new List<String>();
                foreach(string line in lines)
                {
                    st.stationNames.Add(line);
                }
            }
            return st;
        }
    }
    class StationStore
    {
        public List<string> stationNames = new List<string>();
        public int currentIndex;
    }
}
　