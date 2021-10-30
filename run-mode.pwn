#include <a_samp>

public OnPlayerConnect(playerid)
{
    SetPVarint(playerid, "runMode", 0);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext)
{
    if(!strcmp(cmdtext, "/runmode1", true))
    {
        SetPVarint(playerid, "runMode", 1);
    }
}

public OnPlayerKeyStateChange(playerid, oldkeys, newkeys)
{
    if(newkeys  == KEY_SPRINT)
    {
        SetPVarInt(playerid, "Run", 1);
    }
    if(newkeys != KEY_SPRINT && oldkeys == KEY_SPRINT)
    {
        SetPVarInt(playerid, "Run", 0);
    }
}

public OnPlayerUpdate(playerid)
{
    if(GetPVarInt(playerid, "Run") == 1)
    {
        if(GetPVarInt(playerid, "RunMode") == 1)
        {
            ApplyAnimation(playerid, "PED", "WOMAN_RUNPANIC", 4.0, 1, 1, 1, 0, 0, 1);
        }
    }
}
