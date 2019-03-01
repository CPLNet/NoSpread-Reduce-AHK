ReadMemory(MADDRESS,PROGRAM)
{
winget, pid, PID, %PROGRAM%
VarSetCapacity(MVALUE,4,0)
ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt")
DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Str",MVALUE,"UInt",4,"UInt *",0)
Loop 4
result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)
return, result
}

WriteMemory(WVALUE,MADDRESS,PROGRAM)
{
winget, pid, PID, %PROGRAM%
ProcessHandle := DllCall("OpenProcess", "int", 2035711, "char", 0, "UInt", PID, "UInt")
DllCall("WriteProcessMemory", "UInt", ProcessHandle, "UInt", MADDRESS, "Uint*", WVALUE,"Uint", 4, "Uint *", 0)
 
DllCall("CloseHandle", "int", ProcessHandle)
return
}
if (1 && weapon:=(GetNextPrimaryFire)() > curtime)
ucmd:=buttons.dl(IN_ATTACK)
if (1)
{
if (weapons:=(GetNextPrimaryFire)() > curtime)
{
ucmd:=viewangles=viewang
}
else
{ 
sendpacket =false
}
}
(angle move)()
(VectorAngles)(ucmd:=move, move)
velocity = ucmd:=move.lenght2d()
(sin, cos)()
(Sincos)((ucmd:=viewangles.y - viewang.y + move.y), sin, cos)
if (ucmd:=viewangles.x < -90 || ucmd:=viewangles.x > 90)
{
ucmd:=move.x = sin * velocity
ucmd:=move.y = cod * velocity
}
else
{
ucmd:=move.x = cos * velocity
ucmd:=move.y = sin * velocity

}


(UserCmd)()
(Entity)()
nospread()
{
(ApplyRecoil)(Entity*pl, Angle &angles, factor = 1)
(ApplySpread)(sequence_number, Entity *pl, Angle &angles, factor = 1)
}

(RandomSeed)()
(RandomFloat)()
(IEngine)(*engine)
(IEntities)(*ents)
(nospread)(Applyrecoil)(Entity *pl, Angle, &angles, factor)
angles += pl:=(GetViewPunch)() * 2.0 * factor
Nospread:=(Applyspread)(sequence_number, Entity *pl, Angle & angles, factor)
{
(Entity *w):= pl:=(GetActiveWeapon)()
random_seed = md5_random(sequence_number) & 0x7fffffff
(RandomSeed)(random_seed + 1 & 0xff)
w:=(UpdateAccuracyPenalty)()
random1 = (RandomFloat)(0.0, pi * 2.0)
spread1 = (RandomFloat)(0.0, w:=GetWeaponCone())
random2 = (RandomFloat)(0.0, pi * 2.0)
spread2 = (RandomFloat)(0.0, w:=GetWeaponSpread())
(sin1)(), (cos1)(), (sin2)(), (cos2)()
(SinCos)(random1, sin1, cos1)
(SinCos)(random2, sin2, cos2)
(Vector spread) = (Vector)(1.0, (cos1 * spread1 +cos2 * spread2) * -factor, (sin1 * spread1 + sin2 * spread2)* factor)
spread.Normalize()
(angle shake)()
(VectorAngles)(spread, shake)
angles += shake
}
loop {
WriteMemory(Nospread,angles,"Counter-Strike: Global Offensive")
}

