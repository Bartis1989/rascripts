// Command & Conquer: Red Alert
// #ID = 8712
// md5: b75ccdf07133e5d0ec85fa97556cbfea - Soviet Disc
// md5: bc4fdf0d5ad1378bdbadb434289f4613 - Allied Disc
// By: Bartis1989 for Retroachievements.org


//     ________      ________         ________                  ________      _______       ________          ________      ___           _______       ________      _________   
//    |\   ____\    |\   __  \       |\   ____\     ___        |\   __  \    |\  ___ \     |\   ___ \        |\   __  \    |\  \         |\  ___ \     |\   __  \    |\___   ___\ 
//    \ \  \___|    \ \  \|\  \  /\  \ \  \___|    |\__\       \ \  \|\  \   \ \   __/|    \ \  \_|\ \       \ \  \|\  \   \ \  \        \ \   __/|    \ \  \|\  \   \|___ \  \_| 
//     \ \  \        \ \__     \/  \  \ \  \       \|__|        \ \   _  _\   \ \  \_|/__   \ \  \ \\ \       \ \   __  \   \ \  \        \ \  \_|/__   \ \   _  _\       \ \  \  
//      \ \  \____    \|_/  __     /|  \ \  \____      ___       \ \  \\  \|   \ \  \_|\ \   \ \  \_\\ \       \ \  \ \  \   \ \  \____    \ \  \_|\ \   \ \  \\  \|       \ \  \ 
//       \ \_______\    /  /_|\   / /   \ \_______\   |\__\       \ \__\\ _\    \ \_______\   \ \_______\       \ \__\ \__\   \ \_______\   \ \_______\   \ \__\\ _\        \ \__\
//        \|_______|   /_______   \/     \|_______|   \|__|        \|__|\|__|    \|_______|    \|_______|        \|__|\|__|    \|_______|    \|_______|    \|__|\|__|        \|__|
//                     |_______|\__\                                                                                                                                              
//                              \|__|
 

//Achievement ideas:
// - Progression achievements for all missions. One type for any difficulty and one type for the hard difficulty
// - Damageless Tanya missions (With additional challenges, like destroying everything in the progress etc.)
// - Speedrun achievements (Might be just part of certain missions like the spy missions and Tanya missions)
// - Certain mission completed without losing a single unit (test if plausible)



//32-bit Campaign ID
function Campaign_ID() => dword(0x00b8c0)
Allied = 0x313b3133
Soviet = 0x313b3538

// 8-bit Current mission (Value stays the same during complete-screens and cutscenes)
function Mission() => byte(0x1fff88)

// 8-bit Mission condition
function Mission_Condition() => byte(0x1bb2c7)
Mission_Ingame = 0
Mission_Complete = 1
Mission_Failed = 2

// 32-bit Current amount of money
function Current_Moneycount() => dword(0x2a3d4)

// 8-bit Total units killed in current mission
function Killcount() => byte(0x2a414) // Check if this has a bigger size than 8-bit

// Total number of enemy units in current mission
function Enemy_Count() => byte(0x2a788) // Same as above

// 8-bit Mission ID (same for both Allied and Soviet)
function Current_Mission() => byte(0x2a9cc)

// 8-bit Sidebar inputs (Used for cheat codes)
// X = 0
// O = 1
// Triangle = 2
// Square = 3
function Input_One() => byte(0x1bb380)
function Input_Two() => byte(0x1bb381)
function Input_Three() => byte(0x1bb382) 
function Input_Four() => byte(0x1bb383)
function Input_Five() => byte(0x1bb384)
function Input_Six() => byte(0x1bb385)

//8-bit How many inputs you currnetly have typed in the cheat. (Cheats should always have total 6 inputs)
function Tot_Inputs() => byte(0x1bb388)


//Collection of protection functions for spesific cheats.
function Nuclear_Cheat() => unless(Input_One() == 1 && Input_Two() == 0 && Input_Three() == 1 && Input_Four() == 2
                            && Input_Five() == 3 && Input_Six() == 2 && once(Tot_Inputs() == 6))
                            
function Chronoshift_Cheat() => unless(Input_One() == 2 && Input_Two() == 1 && Input_Three() == 1 && Input_Four() == 3 
                                && Input_Five() == 3 && Input_Six() == 0 && once(Tot_Inputs() == 6))
                                
function Insta_Victory_Cheat() => unless(Input_One() == 0 && Input_Two() == 3 && Input_Three() == 3 && Input_Four() == 1 
                                  && Input_Five() == 2 && Input_Six() == 1 && once(Tot_Inputs() == 6))
                                  
function Money_Cheat() => unless(Input_One() == 3 && Input_Two() == 3 && Input_Three() == 1 && Input_Four() == 0 
                          && Input_Five() == 2 && Input_Six() == 1 && once(Tot_Inputs() == 6))                                 
                                
function Full_Map_Cheat() => unless(once(byte(0x1bb030) == 1))


// Combined function to protect against all relevant cheats
function All_Cheat_Prot() => Nuclear_Cheat() && Chronoshift_Cheat() && Insta_Victory_Cheat() && Money_Cheat() && Full_Map_Cheat()




// Progression Achievement Mission 1 (Any difficulty) Alternate way without using dictionaries
//achievement (
//    title = "test", description = "test", points = 0,
//    trigger = Campaign_ID() == Allied && Trigger_Mission_Complete(1) || (never(Mission_Condition() == Mission_Failed) && always_false())
//)



//Test for Mission in Range

Mission_List_Allied = {
    1:{"Name": "Mission 1 Allies", "Description": "Mission 1 Complete", "Points": 0},
    2:{"Name": "Mission 2 Allies", "Description": "Mission 2 Complete", "Points": 0},
    3:{"Name": "Mission 3 Allies", "Description": "Mission 3 Complete", "Points": 0},
    4:{"Name": "Mission 4 Allies", "Description": "Mission 4 Complete", "Points": 0},
    5:{"Name": "Mission 5 Allies", "Description": "Mission 5 Complete", "Points": 0},
    6:{"Name": "Mission 6 Allies", "Description": "Mission 6 Complete", "Points": 0},
    7:{"Name": "Mission 7 Allies", "Description": "Mission 7 Complete", "Points": 0},
    8:{"Name": "Mission 8 Allies", "Description": "Mission 8 Complete", "Points": 0},
    9:{"Name": "Mission 9 Allies", "Description": "Mission 9 Complete", "Points": 0},
    0x0a:{"Name": "Mission 10 Allies", "Description": "Mission 10 Complete", "Points": 0},
    0x0b:{"Name": "Mission 11 Allies", "Description": "Mission 11 Complete", "Points": 0},
    0x0c:{"Name": "Mission 12 Allies", "Description": "Missio12 2 Complete", "Points": 0},
    0x0d:{"Name": "Mission 13 Allies", "Description": "Mission 13 Complete", "Points": 0},
    0x0e:{"Name": "Mission 14 Allies", "Description": "Mission 14 Complete", "Points": 0}
}




function Trigger_Mission_Complete(Mission_Id) => (once(Mission() == Mission_Id && prev(Mission_Condition()) == Mission_Ingame && 
                                                  once(Mission_Condition() == Mission_Complete))) && All_Cheat_Prot()
                                                  
                                                  
// Allied Proggression achievements (Any Difficulty)
for Mission_Id in Mission_List_Allied{
achievement(
    Mission_List_Allied[Mission_Id]["Name"],
    Mission_List_Allied[Mission_Id]["Description"],
    Mission_List_Allied[Mission_Id]["Points"],
    trigger = Campaign_ID() == Allied && 
              Trigger_Mission_Complete(Mission_Id) || 
              (never(Mission_Condition() == Mission_Failed) && 
               always_false())
)
    
}
  

Mission_List_Soviet = {
    1:{"Name": "Mission 1 Soviet", "Description": "Mission 1 Complete", "Points": 0},
    2:{"Name": "Mission 2 Soviet", "Description": "Mission 2 Complete", "Points": 0},
    3:{"Name": "Mission 3 Soviet", "Description": "Mission 3 Complete", "Points": 0},
    4:{"Name": "Mission 4 Soviet", "Description": "Mission 4 Complete", "Points": 0},
    5:{"Name": "Mission 5 Soviet", "Description": "Mission 5 Complete", "Points": 0},
    6:{"Name": "Mission 6 Soviet", "Description": "Mission 6 Complete", "Points": 0},
    7:{"Name": "Mission 7 Soviet", "Description": "Mission 7 Complete", "Points": 0},
    8:{"Name": "Mission 8 Soviet", "Description": "Mission 8 Complete", "Points": 0},
    9:{"Name": "Mission 9 Soviet", "Description": "Mission 9 Complete", "Points": 0},
    0x0a:{"Name": "Mission 10 Soviet", "Description": "Mission 10 Complete", "Points": 0},
    0x0b:{"Name": "Mission 11 Soviet", "Description": "Mission 11 Complete", "Points": 0},
    0x0c:{"Name": "Mission 12 Soviet", "Description": "Missio12 2 Complete", "Points": 0},
    0x0d:{"Name": "Mission 13 Soviet", "Description": "Mission 13 Complete", "Points": 0},
    0x0e:{"Name": "Mission 14 Soviet", "Description": "Mission 14 Complete", "Points": 0}
}  
  
// Allied Proggression achievements (Any Difficulty)
for Mission_Id in Mission_List_Soviet{
achievement(
    Mission_List_Soviet[Mission_Id]["Name"],
    Mission_List_Soviet[Mission_Id]["Description"],
    Mission_List_Soviet[Mission_Id]["Points"],
    trigger = Campaign_ID() == Soviet && 
              Trigger_Mission_Complete(Mission_Id) || 
             (never(Mission_Condition() == Mission_Failed) && 
              always_false())
)
    
}  
  
  
  
  
  
  
  
  
  
  
  