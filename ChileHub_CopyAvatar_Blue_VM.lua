--[[ ChileHub CopyAvatar Blue-VM v4080 | By Mac | Real dispatcher + runtime key ]]
local _ENV=(getfenv and getfenv())or _G
local bit=bit32 or bit
local _bxor=bit.bxor
local _band=bit.band
local _bor=bit.bor
local _lshift=bit.lshift
local _rshift=bit.rshift
local _rol=function(b,n) n=n%8 return _bor(_lshift(b,n),_rshift(b,8-n))%256 end
local _ror=function(b,n) n=n%8 return _bor(_rshift(b,n),_lshift(b,8-n))%256 end
local function _rk()
	local t=tick and tick() or os.clock()
	local p=(game and game.PlaceId) or 0
	local j=(game and game.JobId) or ""
	local h=0
	for i=1,#j do h=_bxor(h,j:byte(i)*i) end
	return _bxor(_band(p,0xFFFF),_band(h,0xFFFF),_band(math.floor(t*1000),0xFFFF))
end
local _K={218,128,102,125,147,95,245,58,245,75,187,234,228,200,248,118,123,181,83,162,125,48,111,176,187,117,80,84,40,117,201,89}
local function _dk(blob,kid)
	local out,ks={},#_K
	local rk=_rk()
	for i=1,#blob do
		local c=blob[i]
		c=_bxor(c,_K[((i-1)*3+kid)%ks+1])
		c=_rol(c,(kid%5)+1)
		c=_bxor(c,(kid*i*17+rk)%256)
		c=_ror(c,((i-1)%7)+1)
		c=_bxor(c,_K[((i-1)+kid)%ks+1])
		out[i]=string.char(c)
	end
	return table.concat(out)
end
local _POOL={
[1]={122,92,22,19,101,225,27}
[2]={41,240,15,22,187,119,133,247,33,242,103,143,114,147,181,126}
[3]={45,179,203,253,40,127,65,64,115,219,33,220}
[4]={202,244,206,42,140,208,104,184,58,34,160}
[5]={65,234,38,140,102,147,151,244,95,189,172,104,41,61,3}
[6]={128,170,216,196,29,184,115,238,2,240}
[7]={234,90,224,89,113,152,137,244,138,241,37,235,2,186,79,64,233}
[8]={59,239,206,88,156,132,46,170,43,163,145,254,229,232,31,184,220,30,75,191,90,140}
[9]={127,57,175,212,56,106,149,115,161,113,58,172,137,163}
[10]={160,69,129,246,113,127,52,197,84,246,251,70,154,97,121,183,82,30,207,146,141,208,23,27,114,152,165}
[11]={56,178,18,253,82,159,63,166,208,27,113,200,46,73,29,47,220,63}
[12]={135,160,74,176,125,126,125}
[13]={194,99,15,42,244,117,87,157,43}
[14]={202,157,77,137,171,132,248,111,62,9,134,172,255,77,169,47}
[15]={10,157,53,228,119,50,213,39}
[16]={226,188,239,61,159,43,53,67}
[17]={42,178,54,154,3,67,30,6,11,9,36}
[18]={140,203,221,233,158,138,100,158,31,12}
[19]={55,32,226,14,14,91,48,150}
[20]={52,243,58,217,8,228}
[21]={10,116,85,49,9,241,65,130,10,213,91,36,139,191}
[22]={9,126,182,52,59,197,71,46,140,59,23,12}
[23]={205,222,20,151,63,135,7,22,61,165,255,76,62,47}
[24]={241,99,207,25,186,209,103}
[25]={140,39,64,6,68}
[26]={164,35,28,94,40,121}
[27]={238,85,141,217}
[28]={186,236,179,15,60,95,34}
[29]={55,64,180,68,28,20,57,197,109,155}
[30]={77,225,87,207,40}
[31]={105,37,224,249}
[32]={98,56,137,114,156}
[33]={69,219,107,82}
[34]={64,230,229,224,70}
[35]={203,51,40,10,124}
[36]={170,116}
[37]={228,174,31,33,246,45,1,19}
[38]={78,19,40}
[39]={37,63,57,182,42,193}
[40]={141,8,85,88,232,71,152}
[41]={59,103,174,198,93}
[42]={117,177,6,148,230,164,36,68,172,163}
[43]={78,188,49,47,197,13,90,74,197}
[44]={84,28,142,66,218,201,252}
[45]={254,91,87,226}
[46]={208,186,98,218}
[47]={132,232,210,128,127,218}
[48]={178,55,26,29,52,59,24,188,140,181,156,214}
[49]={248,120,185,97,73,42,106,44,30,55}
[50]={61,44,28,248,164,2,124,3}
[51]={107,134,36,225,194,179,187,241,109,82}
[52]={136,243,252,55,184,26,28,145,253}
[53]={75,79,129,92,255}
[54]={150,183,197,19,208,97,2,125,45,105}
[55]={13,76,110,231,182,227,143,40,119}
[56]={164,94,82,107,174,137,103,198,185,89,94}
[57]={24,147,206,34,108,187,51,156}
[58]={7,181,177,30,12,18,67,53}
[59]={204,67,217,46,126,14,219,15,175,231}
[60]={55,165,47,177,247,138,228}
[61]={69,206,109,171,186,115,77,107,178,228,143,41}
[62]={164,184,206,58,201,26,185,138,212}
[63]={103,111,205,15,72,31,47,53,248,103,171,171,196,80}
[64]={97,218,45,122,150,42,191}
[65]={97,31,220,180,101,242,86,95,66,111,145,194,142,73,159,0,219,111,22,120,150}
[66]={255,228,183,55,177,59,254,152,251,78,136,91,246,133,33,148,50,148,28,186,64,141}
[67]={235,184,84,211,120,39,128,85,220,240,136,200,200,164,187,92,125,95,108,92,157,64}
[68]={23,17,226,190,174,64,191,105,80,49,239,164,103,32,42,16,27,43,28,115,114,118,241,154,134,226,127,74,107,24,5,115}
[69]={222,77,143,113,172,106,83,71,90,202,169,133,143,164,178,207,8,216,49,161,191,30,234,137,226,215,163,78,192,59,193,246,47,32}
[70]={81,231,101,178,243,137,65,108,233,159}
[71]={40,59,85,63,229,58,243,150,170,77,157,203,43}
[72]={200,181,135,75,34,90,15,93,114}
[73]={11,96,34,183,67,206,161,147,138,202,43,139}
[74]={145,108,71,37,81,48,123,206,179,205}
[75]={224,9,136,52,243,6,14,122,242,10}
[76]={224,39,51,38,188,120}
[77]={85,152,123,191,21,54,119,237}
[78]={7,199,196,66,36,87,18,182,71}
[79]={98,155,168,50,105,172,49,166,54,138,0,121}
[80]={113,251,209,33,253,114,12,74,157,51,64}
[81]={65,42,171,171,104,106,133,255,103,179,140,71,28}
[82]={127,154,105,29,133,178,143,76,155}
[83]={131,179,108,183,6,21,215,11,124,234,172,50,58}
[84]={174,93,81,94,137,123,220}
[85]={92,74,233,192,229,128,108,222,63}
[86]={147,247,76,150,130,93,170,135,136,137}
[87]={57,65,86,149,82,137,226,177,22,26,82,13}
[88]={136,100,231,142,224,67,178,163,7,240,144,131}
[89]={141,70,23,59,75}
[90]={94,253,23,68,166,15,106,218,105,37,248,58,142}
[91]={86,223,175,179,115,178,139,241,203,10,202,83,120,19}
[92]={96,199,197}
[93]={39,173,201,15,131,150,115,20,17,52,162,189,27,143,101}
[94]={140,88,29,67,45,31}
[95]={223,112,94,82,11,184,20,80,155}
[96]={232,227,218,11}
[97]={89,96,20}
[98]={36,8,228,89,12,171,182,3,59,83,185,161,242}
[99]={100,176,238,153,114,70,242,171,134,24,92,45,159}
[100]={42,184,171,87,72,78,151,244,200,77}
[101]={2,158,163,17,129,189,122,79}
[102]={103,27,205,90,7,142,209,178,23,138,193,193,206,68,135,220,31,203,139}
[103]={108,118,135,100,198,34}
[104]={141,99,44,207,70,38,8,100,189,253,107,235,79,233,249,91,107}
[105]={117,83,87,11,50,104,64,175,18}
[106]={176,40,205,125,5,65,253,164,195,22,101}
[107]={101,202,225,221,148,75,122,98,59,235,233,251,157,118}
[108]={9,154,127,209}
[109]={13,185,32,28,138,184,237,198,238,41,231,130,115,179}
[110]={144,210,188}
[111]={113,157,102,83,156,171,168,170,75,34,170,131}
[112]={252,71,58,45,33}
[113]={118,46,143,181,250,151,87,186,173,0,87,171,185,28}
[114]={212,44,157,252,7,234,27}
[115]={62,16,96,250,61,134,112,54,244,139,90,164,68,58}
[116]={159,224,179,167,19,135,29,182,97,130,165,214}
[117]={195,92,222,170,158,103,186,6,210,219,238,97}
[118]={132,203,167,151,190,94,212,178,172,119,28,130,82,234,96,74,251,113,41,189,60,148}
[119]={211,107,136,191,22,100,50,190,106,99,255,122,112,72,213,46}
[120]={126,127,8,118,227,188,88,85,96,18,247,7,145,183,94}
[121]={37,89,59,240}
[122]={77,206,127,101,131,28,172,234}
[123]={6,12,117,220,122,128,143,139,237,175,39}
[124]={241,221,233,75,247,89,179}
[125]={48,148,227,115,111,175}
[126]={221,111,5,77,129,253,125,28,107,236,211,107,187,217,89,142}
[127]={210,120,154,233,132}
[128]={126,152,229,63,42,214,82,202,170,223,47,65,5,91,196,109,250}
[129]={73,95,118,149}
[130]={131,94,93,236,22,107,61,216,206,253}
[131]={19,157,36,162,51,38,106,16}
[132]={226,247,18,228,87,49,25,60,221,246,215}
[133]={188,233,115,147,211,85,221,98,247,188,7,116,239,32,80,211}
[134]={31,137,91,1,93,21,206,190,128,195,139,4,177,96,144}
[135]={171,87,199,147,251,166,21,123,253,120,53,80,10,105,34,145,119}
[136]={188,60,225,100,21,246,144,225,84,95,234,210,237,166,230,9,22,124}
[137]={140,91,248,102,82,223,155,56,204,62,137,206,88,136,170,38,103,82,9,46}
[138]={41,178,141,0,2,166,59,242,23,65}
[139]={62,170,200,146,41,19,85,174,156,215,48,26,135,166,131,255,100,9,98}
[140]={156,89,89,88,220,193,186,221,239,174,241,37,68,107,3,96,31,147}
[141]={95,29,215,171,128,197,9,206,6,130,241,198,14,228,159,1,76}
[142]={99,210,154,2,148,80,186,139,169,221,227,13}
[143]={246,127,207,38,87,235,114,46,200}
[144]={192,29,218,37,69,16,144,158,14,72,173,6}
[145]={51,43,191,112,227}
[146]={146,4,42,178,243,25,73,36}
[147]={127,197,239,81,208}
[148]={121,224,128,52,129,153,72}
[149]={197,87,134,155,17,136,68,30,11,25}
[150]={34,226,79,65,4,4,30,236,21,4,137,42,163}
[151]={57,229,228,210,164,45,251,75,224,26,154}
[152]={130,109,253,60,116,174,232,14,22,116,14,6}
[153]={21,205,99,88,93,74,24,243,186,152,10,18,1,203,115}
[154]={189,89,200,238,39,95,200,80,132,168}
[155]={19,112,62,5,227,145,254,56,64,4}
[156]={220,104,212,142,211,48,165,221,55,202,173,160,240,72,4,210}
[157]={40,134,124,69,9,2,87,249,219,70,28,55,85,255}
[158]={125,66,65,82,167,178,97,216,106,93,78,187,152,127,210,47,34}
[159]={228,177,121,58,90,209,174}
[160]={215,51,88,109,186,123,43,221,177}
[161]={121,116,70,235,53,35,238}
[162]={237,251,13,28,247,87,163,245,35}
[163]={175,182,207,245,16,13,107,203,110,203,93,252}
[164]={61,208,201,62,168,194,97,137,88,229,173,186,129,224,32,235,212,142,160,184,203,150,0,85}
[165]={69,97,53,144,122,227,147,185,91,139,132,76,61,37}
[166]={182,254,228,5,189,126,5,230,16,180,248,154}
[167]={41,159,232,78,123,132,71,244,13,115,52,173}
[168]={51,226,224,0,180,70,86,187,54,171,213,87,45}
[169]={45,31,237,203,57,116,140,34,132,249,48,168}
[170]={110,84,155,196,5,157}
[171]={70,192,122,173,194,25,239,163,194}
[172]={100,164,206,182,85,58,43,203,141,101}
[173]={88,79,121,122,220,37,74,30}
[174]={106,28,202,9,180,244,203,31,253,11,11}
[175]={84,8,47,230,103,210,17,39}
[176]={240,130,131,12,79,72,229,88,195,174}
[177]={205,61,186,167,11,211,100,39}
[178]={134,223,241,193,54,203,220,150}
[179]={118,96,46,4,6,95,111,231}
[180]={63,101,38,219,4,92,6,1,234,43,238}
[181]={12,84,69,41,26,54,22}
[182]={100,241,189,41,101,37,69,106,15,50,13,14,77,55,84,209,202,62,27,252,243,185,67,146,23}
[183]={198,217,18,7,119,199,79,149,7,183}
[184]={147,228,201,13,178,233,20}
[185]={204,129,14}
[186]={214,237}
[187]={207,81,3,223,101,28,19,226,143}
[188]={38,198,157,87,173,143,74,105,58}
[189]={102,193,118,70,36,16,86,133,142,221}
[190]={68,236,73,231,60,100,137,53,95,181,136,8,70,148,150,116,208,240,101}
[191]={99,89,196,201}
[192]={7,121,135,97,174,249,9,145,230,129,83,216,57,145,15,189,32}
[193]={102,230,111,38,213,3,53,122,135}
[194]={35,6,162,228,81,49,75,226,26,136,79,175,251,118,35,59,205,119}
[195]={139,175,58,54,120,105,15,163,162,31,14,27}
[196]={144,94,80,232,83,205,35,84,127,167,40,50,101,101,247,28,77,151,7,224}
[197]={106,226,150,50,218,72,62}
[198]={89,7,26,211,212}
[199]={23,248,187,63,110}
[200]={216,49}
[201]={61,173}
[202]={53,189,11,159,148,160,98,100,172}
[203]={222,187,15,43}
[204]={34,56,76,204,209,251,128,146,157,24}
[205]={185,212,88,224,106,231}
[206]={231,194,102,18,180,33,127,134,166}
[207]={132,171,94,144,43,230,90,70,137}
[208]={142,26,18,9,132}
[209]={136,57,58,98,68,42,245,237,250}
[210]={112,51,30,216,0,10,88,193,241,150}
[211]={7,230,16,33,226,208,173,234,39,71}
[212]={138,117,255,56,244,158,118,176,59,158,220}
[213]={86,104,167,24,246,78,53,245,200,103,121,5,60}
[214]={38,53,65,144,194,121,73,141,234,175,74,2,73,82}
[215]={214,87,102,213,14,163,145,165,112,102,45,165,229}
[216]={165,110,38,219,175,78,255,211,241,17,238,141,255,9}
[217]={222,215,221,55,106}
[218]={141,141,211,62,60}
[219]={171,97,87,42,104,74,180,79,109,230,140,174}
[220]={119,187,3,165,215}
[221]={70,254,129,139}
[222]={169,191,85,59,167,10,99,201}
[223]={111,108,251,31,72,255,135,164,226,29,251}
[224]={98,220,40,126,164,18,204}
[225]={96,31,206,194,33,202,59,26,66,114,157,222,122,81,90,135,251}
[226]={132,164,147,159,33,88,75,189,165,158,232,168,102,228,74,218,38,109}
[227]={139,62,211,226}
[228]={143,43,246,50,6,194,182,236,91,59}
[229]={222,236,136,242,187}
[230]={12,249,105,228,255,169,13,40,229,179,28,38}
[231]={34,45,33,103,132,184,78,180,180,17}
[232]={74,48,138,79,114,62,169,252,112}
[233]={187,65,6,155,139,143,107,129,156,194,19,19}
[234]={0,9,207,63,115,58,38,110,114,194,202,211,75,183,54,176,251,165,183}
[235]={238,8,160,114,179,118,27,188}
[236]={222,43,43,175,236,216,14,37,184,184,84,200,18,91,226,45,60,180,116,49,126,141,185,125,46}
[237]={61,86,113,190,21,78,81,172,137}
[238]={20,203,236,6,44,102,42,55,84,82,230}
[239]={146,220,232,181,65,160,84,86,240,205,138,118,232}
[240]={124,114,223,27}
[241]={17,104,151,146}
[242]={60,89,251,9,137,230,201,207,89}
[243]={138,180,90,187,150,148,43,141}
[244]={88,56,214,90,159,123}
[245]={159,66,237,250,137,40,10,219,56,70,124,45,4}
[246]={185,171,40,86,211}
[247]={155,135,83,143,88,33}
[248]={60,82,239,246,113,161,74,45,63,204,172,89}
[249]={221,37,213,52,83,147,126,255,119,46,29,140}
[250]={81,96,28,88,234,206,181,91,117,37,230}
[251]={71,201,223,11,145,210,223,237,203,54,210,2,10}
[252]={207,9,77,227,110,8,222,240}
[253]={47,187,211,79,107,180,111,25,3,40,134,132,211,30,249}
[254]={236,186,219,195,47,33,15,96,249,233,254,223,89}
[255]={195,109,81,80,66,211,8,65,49}
[256]={232,245,190,227,230,208,235,244,74,16,253}
[257]={158,107,158,161,59,154,248,71,176,252,32,109,37,210,228,202,167,152,123,172,233,36,16,36,246,160,221}
[258]={168,24,254,65,60,91,29,133,24,47,177,49,203,76,4,238,104,109,46,164,29,202,109,68,121}
[259]={131,53,169,27,95,76,153,187,161,89,94,18,180,134,249}
[260]={109,183,190,71,20,6,88,244,200,85,34}
[261]={53,222,191,209}
[262]={36,156,67,80}
[263]={93,86,161,44,86}
[264]={47,228,46,67,73,6}
[265]={244,92,74,33,162,216,78,172,14,129,239,86,191,54,16}
[266]={195,96,169}
[267]={196,12}
[268]={150,189,97,165,195,230}
[269]={173,185,96,19,179,220,16,6,45,237,230,141,108,245}
[270]={10,199,189,2,228,141,239,227,153,107,11,52,228,168,58,97,210,55,40,127,250,34}
[271]={118,169,70,203,206,239,220,181,119,82,42,163,136}
[272]={120,71,38,38}
[273]={242,63,217,53,211,34,46,162,159,146,87,193,67,139,126,94,222,87,178,94,26,97,248}
[274]={194,40,8,104,12,242}
[275]={180,15,116,116,41,142,39,242,248,182}
[276]={152,236,131,95,146,66,207,197,27,158,79,39,177,253,222,167,21,224,37,9,207,33,167,30}
[277]={13,87,212,177,142,47}
[278]={12,213,169,191,182,78}
[279]={128,239,11,55,22,68,69}
[280]={123,112,24,112,171,108,46,212}
[281]={65,1,39,8,84,234,46,125,185}
[282]={141,73,243,107,137,16,118,202,90}
[283]={151,55,125,140,50,224,243,140,254}
[284]={192,156,107,75,226,85,156,50,80,8,163,213}
[285]={233,138,239,93,47,31}
[286]={239,17,101,13,129,121,168}
[287]={209,183,13,207,224,107,57,66,250,227,138,197,20,153}
[288]={192,140,169,143,83,166,140}
[289]={57,89,249,130,6,246,81,159,140,122,246,184,161,145,104}
[290]={203,228,113,84,86,9,51,11,92,246,97,236,8,181,68,87,28,205,67,48,71,215,205,125,10,98,247,72,138,128,168,56,169,249,157,219,229,110,134,45,18}
[291]={27,229,172,27,84,67,55,37,182,234,38,193}
[292]={234,248,153,251,45,61,51,247,26,243,154,65,72,18,201,156,22,59,147}
[293]={116,42,37,163,83,230,212,236,229,250,51,103,54,242,86,197,18,0,254,207,216,14,22,174,159,17,196}
[294]={44,47,14,5,86,13,189,95,33,64,161,56,186,7,162,60,118,201,88,238,28,179,24,113,74,66,115,233,217,211,12,210,74,232,124,240,205,170,28,164,160,91,137,126,198,154,26,44,90,111,30,173,232,222,187,206,37,158,133,17,1,183,158,193,84,110,100,166,108,205,132}
[295]={235,88,216,151,179,252,185,57,252,96,23,148,30}
[296]={188,16,209,204,149,85,120,199,74,139}
[297]={184,96,226,100,70,219,224,184,201,172,135,68,10,12,225,164,102,92,1,106,179,129,205,226,72,59,244,55,37}
[298]={41,166,41,108,114,55,244,242,59,121,133,112,144}
[299]={47,142,137,49,53,57,72,58,31,88,51,2,160,164,243,120,227,37}
[300]={68,210,90,214,168,1,23,78,115,131,195,65,224,211,15,99,7,11}
[301]={106,71,147,211,161,97}
[302]={65,80,16,7,150,36,13,74,53,122,190}
[303]={64,99,117,50,95,31,122,160,192,221,34,214,137,172,55,130,6}
[304]={209,63,216,166,71,36,169,187,104,14,15,30,175,31,207,99,19,137,203,164,43,21}
[305]={124,51,231,88,163,234,88,150,244,235,90,61,163,225,250,219,229,45,252,209,37,51,254,101,242,111,131,140,0}
[306]={145,22,78,90,242,26,234,38,167,77,130,97,205,166,234,158,235,18,2,135,85,138,141,17,248,153,60}
[307]={29,133,237,88,218,187,187,66,108,28,8,135,107,71,225,77,113,111,194,110,12,64,60,127}
[308]={229,208,32,16,105,40,176,85,118,112,113,181,205,182,230,163,252,97,32,63,9}
[309]={84,85,144,31,8,186,93,89,75,152,15,107,11,125,141,82,23,242,109,133,146}
[310]={251,240,86,125,36,100,42,167,187,88}
[311]={63,197,252,202,69,237,47,104,46,35}
[312]={38,34,125,61,114,162,222,200,145,219,4,44,110,148,108,221,128,169,104,229,245,15}
[313]={154,199,227,100,124,154,138,121,155,182,206,66,200,186,251,49,173,95,18,241,37,40,231,153,205,37}
[314]={138,95,152,103,38,37,242,113,7,171,166,210,182,47,16,161,218}
[315]={17,118,54,23}
[316]={226,20,152,110,227,149,241,198,179,175,159}
[317]={233,3,247,30,37,162,105,249,156,229,4,185,159,195,135,13}
[318]={114,82,83,26,175,64,123,85,54,81,6,25,211,238,87,98,176,247}
[319]={183,183,184,48,79,209,133,91,206}
[320]={19,181,85,73,178,208,219}
[321]={24,14,126,123,5,65,123,46,114,86,72,63,103,243}
[322]={175,185,1,16,231,15,3,23,97,234,122,169,114,67,241,62,192,47}
[323]={183,146,243,185,96,77,249,64,80,235,93,148,125,199,187,125,15,66}
[324]={124,82,77,161,188,194,50,41,21,166,47,156,188,230,224,194,5,173}
[325]={217,117,44,182,102,251,62,249,217,236,4,117}
[326]={188,222,193,197,61,178,215,233,98,152,240,219,251,41,177,129,109,86,177,152,31,226,114,70,150,210,140,166}
[327]={12,21,72,69,117,92,173,53,8,249,49,167,59,42,66,66,229,177,249,166,29,113,0,185,161,247,109,129,253,51,152,175,72,102,178,41,187,115}
[328]={141,200,108,36,172,178,222,160,11,159,232,239,4,107,43,175,72,19,75,138,171,160,217,68,60,229,82}
[329]={12,158,191,76,41,72,143,147,32,249,61,172,19,175,154,20,33,99,111,133,162,72,204,117,121,180,153}
[330]={227,89,221,212,125,181,153,86,71,175,217,118,248,17,50,18,83,10,251,42,183,9,132,7}
[331]={88,242,50,253,50,222,89,179,252,99}
[332]={15,42,77,189,29,6}
[333]={195,77,13,74,116,69,3,29,59,208,69,126,1}
[334]={107,123,14,3,171,180,234,15,53,29,160,172,175,13,218,6,70,237,30,115,252,139,123,225,241}
}
local function GS(i)
	local blob=_POOL[i]
	if not blob then return "" end
	return _dk(blob,i*13+7)
end
local _VM={stack={},ip=1,code={},halted=false}
function _VM.push(v) _VM.stack[#_VM.stack+1]=v end
function _VM.pop() local v=_VM.stack[#_VM.stack] _VM.stack[#_VM.stack]=nil return v end
function _VM.run()
	while not _VM.halted and _VM.ip<=#_VM.code do
		local op=_VM.code[_VM.ip]
		_VM.ip=_VM.ip+1
		if op==1 then local n=_VM.code[_VM.ip] _VM.ip=_VM.ip+1 _VM.push(n)
		elseif op==32 then local idx=_VM.code[_VM.ip] _VM.ip=_VM.ip+1 _VM.push(GS(idx))
		elseif op==2 then _VM.pop()
		elseif op==3 then local v=_VM.stack[#_VM.stack] _VM.push(v)
		elseif op==8 then
			local narg=_VM.code[_VM.ip] _VM.ip=_VM.ip+1
			local args={}
			for i=narg,1,-1 do args[i]=_VM.pop() end
			local fn=_VM.pop()
			local rets={fn(unpack(args))}
			for i=#rets,1,-1 do _VM.push(rets[i]) end
		elseif op==9 then return _VM.pop()
		elseif op==10 then local t=_VM.code[_VM.ip] _VM.ip=t
		elseif op==11 then
			local t=_VM.code[_VM.ip] _VM.ip=_VM.ip+1
			local v=_VM.pop()
			if not v or v==0 or v==false then _VM.ip=t end
		elseif op==29 then
		elseif op==30 then _VM.halted=true
		elseif op==31 then local name=_VM.pop() _VM.push(game:GetService(name))
		else _VM.halted=true end
	end
end
local function _junk()
	local a=0
	for i=1,7 do a=_bxor(a,i*19+_K[(i%32)+1]) end
	if a==0xDEAD then print("x") end
	return a
end

--[[ Deobfuscado de: https://pastebin.com/raw/5MA88wuB
 (referenciado por LNREEVeF en su linea 1949)
]]
local Players = game:GetService(GS(1))
local UIS = game:GetService(GS(2))
local TweenService = game:GetService(GS(3))
local HttpService = game:GetService(GS(4))
local ContentProvider = game:GetService(GS(5))
local RunService = game:GetService(GS(6))

if not game:IsLoaded() then game.Loaded:Wait() end
local _lp = Players._lp
while not _lp do
	task.wait()
	_lp = Players._lp
end

local _gn = GS(7)
local _sf = GS(8)
local _sn = GS(9)
local LOGO_ID = 14653905878
local BG_ID = 126614954679548
local _dl = GS(10)
local env = (getgenv and getgenv()) or _G

if env.ChileAvatarCleanup then
	pcall(env.ChileAvatarCleanup)
end

local conns = {}
local function track(c)
	conns[#conns + 1] = c
	return c
end

local function withTimeout(secs, fn)
	local res, done = nil, false
	task.spawn(function()
		local ok, r = pcall(fn)
		if ok then res = r end
		done = true
	end)
	local t0 = os.clock()
	while not done and os.clock() - t0 < secs do task.wait(0.05) end
	return res
end

local function probeImage(id)
	local p = Instance.new(GS(54))
	p.Image = id
	withTimeout(3, function() ContentProvider:PreloadAsync({ p }) end)
	local ok, loaded = pcall(function() return p.IsLoaded end)
	pcall(function() p:Destroy() end)
	return ok and loaded
end

local function textureFromAsset(direct)
	local ok, obj = pcall(function() return game:GetObjects(direct)[1] end)
	if not (ok and obj) then return nil end
	local tex
	if obj:IsA(GS(220)) or obj:IsA(GS(224)) then
		tex = obj.Texture
	else
		local d = obj:FindFirstChildWhichIsA(GS(220), true)
		if d then tex = d.Texture end
	end
	if tex and tex ~= "" then return tex end
	return nil
end

local _Lg = { image = nil, ready = false, subs = {} }
local LOGO_THUMB = GS(334) .. LOGO_ID .. "&w=150&h=150"
local LOGO_DIRECT = GS(333) .. LOGO_ID

local function logoApply(image)
	if _Lg.ready then return end
	_Lg.ready, _Lg.image = true, image
	for _, fn in ipairs(_Lg.subs) do task.spawn(fn, image) end
end

function _Lg.onReady(fn)
	_Lg.subs[#_Lg.subs + 1] = fn
	if _Lg.ready then task.spawn(fn, _Lg.image) end
end

task.spawn(function()
	task.spawn(function()
		if probeImage(LOGO_THUMB) then logoApply(LOGO_THUMB) end
	end)
	task.spawn(function()
		if probeImage(LOGO_DIRECT) then logoApply(LOGO_DIRECT) end
	end)
	task.spawn(function()
		local tex = textureFromAsset(LOGO_DIRECT)
		if tex and probeImage(tex) then logoApply(tex) end
	end)
	task.delay(3, function()
		if not _Lg.ready then logoApply(LOGO_THUMB) end
	end)
end)

local _Bg = { image = nil, ready = false, subs = {} }
local BG_THUMB = GS(334) .. BG_ID .. "&w=768&h=432"
local BG_DIRECT = GS(333) .. BG_ID

local function bgApply(image)
	if _Bg.ready then return end
	_Bg.ready, _Bg.image = true, image
	for _, fn in ipairs(_Bg.subs) do task.spawn(fn, image) end
end

function _Bg.onReady(fn)
	_Bg.subs[#_Bg.subs + 1] = fn
	if _Bg.ready then task.spawn(fn, _Bg.image) end
end

task.spawn(function()
	task.spawn(function()
		if probeImage(BG_THUMB) then bgApply(BG_THUMB) end
	end)
	task.spawn(function()
		if probeImage(BG_DIRECT) then bgApply(BG_DIRECT) end
	end)
	task.spawn(function()
		local tex = textureFromAsset(BG_DIRECT)
		if tex and probeImage(tex) then bgApply(tex) end
	end)
	task.delay(4, function()
		if not _Bg.ready then bgApply(BG_THUMB) end
	end)
end)

do local _j=_junk() task.wait(0.2) end

local function getParent()
	local ok, ui = pcall(function() return gethui and gethui() end)
	if ok and ui then return ui end
	ok, ui = pcall(function() return game:GetService(GS(12)) end)
	if ok and ui then
		local t = Instance.new("Folder")
		local good = pcall(function() t.Parent = ui end)
		t:Destroy()
		if good then return ui end
	end
	return _lp:WaitForChild(GS(13))
end

local parent = getParent()
local old = parent:FindFirstChild(_gn)
if old then old:Destroy() end
local oldIntro = parent:FindFirstChild(GS(331))
if oldIntro then oldIntro:Destroy() end

local WHITE = Color3.new(1, 1, 1)
local BLACK = Color3.new(0, 0, 0)

local IC = {
	title = Color3.fromRGB(230, 240, 255),
	titleLow = Color3.fromRGB(160, 185, 220),
	gold = Color3.fromRGB(50, 130, 220),
	goldLight = Color3.fromRGB(90, 170, 255),
	soft = Color3.fromRGB(140, 165, 195),
	btnText = Color3.fromRGB(200, 220, 245),
	btnBg = Color3.fromRGB(10, 14, 22),
	btnBgMain = Color3.fromRGB(28, 48, 78),
	btnLine = Color3.fromRGB(70, 100, 140),
}

local T = {
	text = IC.title,
	sub = IC.soft,
	line = IC.btnLine,
	gold = IC.gold,
	red = Color3.fromRGB(70, 140, 230),
	green = Color3.fromRGB(60, 200, 160),
	warn = Color3.fromRGB(100, 180, 255),
}

local STYLES = {
	main = { bg = IC.btnBgMain, bgT = 0.3, stroke = IC.gold, strokeT = 0.35, text = WHITE },
	dark = { bg = IC.btnBg, bgT = 0.5, stroke = IC.btnLine, strokeT = 0.7, text = IC.btnText },
	danger = { bg = Color3.fromRGB(20, 35, 60), bgT = 0.35, stroke = T.red, strokeT = 0.5, text = Color3.fromRGB(200, 225, 255) },
	green = { bg = Color3.fromRGB(18, 45, 70), bgT = 0.3, stroke = T.green, strokeT = 0.5, text = WHITE },
}

local data = { saved = {}, favs = {} }

local function do _junk() loadData() end
	local ok, raw = pcall(function()
		if isfile and isfile(_sf) then return readfile(_sf) end
	end)
	if ok and raw then
		local ok2, decoded = pcall(function() return HttpService:JSONDecode(raw) end)
		if ok2 and type(decoded) == "table" then
			data.saved = type(decoded.saved) == "table" and decoded.saved or {}
			data.favs = type(decoded.favs) == "table" and decoded.favs or {}
		end
	end
end

local function saveData()
	pcall(function()
		if writefile then writefile(_sf, HttpService:JSONEncode(data)) end
	end)
end
do _junk() loadData() end

local _UI = {}
local touchOnly = UIS.TouchEnabled and not UIS.MouseEnabled

function _UI.new(class, props)
	local o = Instance.new(class)
	local p
	for k, v in pairs(props) do
		if k == GS(26) then p = v else o[k] = v end
	end
	if p then o.Parent = p end
	return o
end
local new = _UI.new

function _UI.corner(o, r)
	return new(GS(57), { Parent = o, CornerRadius = UDim.new(0, r) })
end
local corner = _UI.corner

function _UI.stroke(o, color, thick, trans)
	return new(GS(58), {
		Parent = o, Color = color, Thickness = thick or 1,
		Transparency = trans or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end
local stroke = _UI.stroke

function _UI.grad(o, c1, c2, rot)
	return new(GS(59), { Parent = o, Color = ColorSequence.new(c1, c2), Rotation = rot or 90 })
end
local grad = _UI.grad

function _UI.tween(o, info, props)
	local t = TweenService:Create(o, info, props)
	t:Play()
	return t
end
local tween = _UI.tween

local gui = new(GS(55), {
	Name = _gn, ResetOnSpawn = false, IgnoreGuiInset = true,
	DisplayOrder = 999, ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	Parent = parent,
})

function _UI.viewport()
	local s = gui.AbsoluteSize
	if s.X < 10 or s.Y < 10 then s = workspace.CurrentCamera.ViewportSize end
	return s
end

function _UI.clampPos(target, x, y)
	local vp = _UI.viewport()
	local sz = target.AbsoluteSize
	return math.clamp(x, 0, math.max(0, vp.X - sz.X)), math.clamp(y, 0, math.max(0, vp.Y - sz.Y))
end
local clampPos = _UI.clampPos

function _UI.draggable(handle, target, onTap, onDown, onUp)
	local dragging, moved, active, startIn, startX, startY = false, false, nil, nil, 0, 0
	track(handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging, moved, active = true, false, input
			startIn = input.Position
			startX, startY = target.Position.X.Offset, target.Position.Y.Offset
			if onDown then onDown() end
			local c
			c = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					c:Disconnect()
					local wasDrag = moved
					dragging = false
					if onUp then onUp(wasDrag) end
					if not wasDrag and onTap then onTap() end
				end
			end)
		end
	end))
	track(UIS.InputChanged:Connect(function(input)
		if not dragging then return end
		if input.UserInputType == Enum.UserInputType.MouseMovement or input == active then
			local d = input.Position - startIn
			if not moved and d.Magnitude < 6 then return end
			moved = true
			local x, y = clampPos(target, startX + d.X, startY + d.Y)
			target.Position = UDim2.fromOffset(x, y)
		end
	end))
end

function _UI.logo(img, fallback)
	img.ImageTransparency = 1
	if fallback then fallback.Visible = true end
	_Lg.onReady(function(image)
		if not image or not img.Parent then return end
		img.Image = image
		tween(img, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 0 })
		if fallback then
			task.delay(0.25, function() fallback.Visible = false end)
		end
	end)
end

function _UI.background(host, overlayT)
	local holder = new(GS(53), {
		Parent = host, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
		BorderSizePixel = 0, ClipsDescendants = true,
	})
	local img = new(GS(54), {
		Parent = holder, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Crop, Image = "", ImageTransparency = 1,
	})
	local sc = new(GS(60), { Parent = img, Scale = 1.12 })
	new(GS(53), {
		Parent = host, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK,
		BackgroundTransparency = overlayT, BorderSizePixel = 0,
	})
	local shade = new(GS(53), {
		Parent = host, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK,
		BackgroundTransparency = 0, BorderSizePixel = 0,
	})
	new(GS(59), {
		Parent = shade, Rotation = 90,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.4),
			NumberSequenceKeypoint.new(0.5, 0.85),
			NumberSequenceKeypoint.new(1, 0.3),
		}),
	})
	_Bg.onReady(function(image)
		if not image or not img.Parent then return end
		img.Image = image
		tween(img, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 0 })
	end)
	return sc
end

function _UI.icon(kind, parent_, color, size)
	size = size or 16
	local root = new(GS(53), {
		Parent = parent_, Size = UDim2.fromOffset(size, size), BackgroundTransparency = 1,
	})
	local inner = new(GS(53), {
		Parent = root, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(16, 16), BackgroundTransparency = 1,
	})
	new(GS(60), { Parent = inner, Scale = size / 16 })

	local fills, strokes = {}, {}

	local function bar(cx, cy, w, h, rot)
		local f = new(GS(53), {
			Parent = inner, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(cx, cy),
			Size = UDim2.fromOffset(w, h), Rotation = rot or 0, BackgroundColor3 = color, BorderSizePixel = 0,
		})
		corner(f, math.min(w, h) / 2)
		fills[#fills + 1] = f
	end

	local function line(x1, y1, x2, y2, th)
		local dx, dy = x2 - x1, y2 - y1
		local len = math.sqrt(dx * dx + dy * dy)
		bar((x1 + x2) / 2, (y1 + y2) / 2, len, th or 1.8, math.deg(math.atan2(dy, dx)))
	end

	local function box(cx, cy, w, h, r, th)
		local f = new(GS(53), {
			Parent = inner, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(cx, cy),
			Size = UDim2.fromOffset(w, h), BackgroundTransparency = 1, BorderSizePixel = 0,
		})
		corner(f, r)
		strokes[#strokes + 1] = new(GS(58), {
			Parent = f, Color = color, Thickness = th, ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		})
	end

	if kind == "close" then
		line(3.8, 3.8, 12.2, 12.2, 2)
		line(12.2, 3.8, 3.8, 12.2, 2)
	elseif kind == "min" then
		bar(8, 11, 10, 2)
	elseif kind == "plus" then
		bar(8, 8, 11, 2)
		bar(8, 8, 2, 11)
	elseif kind == "search" then
		box(7, 7, 10, 10, 5, 1.6)
		line(10.8, 10.8, 14.2, 14.2, 2)
	elseif kind == "copy" then
		bar(6.5, 3.2, 7, 1.6)
		bar(3.2, 6.5, 1.6, 7)
		box(9.5, 9.5, 9, 9, 2, 1.6)
	elseif kind == "trash" then
		box(8, 2.9, 4.6, 3.2, 1.4, 1.4)
		bar(8, 4.9, 12.5, 1.8)
		box(8, 10.6, 9, 8.6, 2, 1.5)
		bar(6.2, 10.8, 1.3, 4.6)
		bar(9.8, 10.8, 1.3, 4.6)
	elseif kind == "star" then
		local pts = {}
		for k = 0, 4 do
			local a = math.rad(-90 + 72 * k)
			pts[k] = { 8 + 7.2 * math.cos(a), 8.7 + 7.2 * math.sin(a) }
		end
		for k = 0, 4 do
			local p, q = pts[k], pts[(k + 2) % 5]
			line(p[1], p[2], q[1], q[2], 1.5)
		end
	elseif kind == "back" then
		line(3, 8, 13, 8, 1.8)
		line(3, 8, 7, 4, 1.8)
		line(3, 8, 7, 12, 1.8)
	end

	local icon = { root = root }
	function icon.set(c)
		for _, f in ipairs(fills) do f.BackgroundColor3 = c end
		for _, s in ipairs(strokes) do s.Color = c end
	end
	return icon
end

function _UI.button(o)
	local S = STYLES[o.style or "dark"]
	local b = new(GS(51), {
		Parent = o.parent, Size = o.size, BackgroundColor3 = S.bg, BackgroundTransparency = S.bgT,
		AutoButtonColor = false, Text = "", BorderSizePixel = 0, LayoutOrder = o.order or 0,
	})
	if o.pos then b.Position = o.pos end
	if o.anchor then b.AnchorPoint = o.anchor end
	corner(b, o.radius or 4)
	local st = stroke(b, S.stroke, 1, S.strokeT)
	local sc = new(GS(60), { Parent = b, Scale = 1 })

	local row = new(GS(53), { Parent = b, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 })
	new(GS(61), {
		Parent = row, FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local tc = o.textColor or S.text
	local icColor = o.iconColor or tc
	local ic, lbl
	if o.icon then
		ic = _UI.icon(o.icon, row, icColor, o.iconSize or 14)
		ic.root.LayoutOrder = 1
	end
	if o.text then
		lbl = new(GS(52), {
			Parent = row, BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, 16), Text = o.text, Font = Enum.Font.GothamMedium,
			TextSize = o.textSize or 12, TextColor3 = tc, LayoutOrder = 2,
		})
	end

	local diamonds = {}
	if o.diamonds then
		for _, side in ipairs({ 0, 1 }) do
			diamonds[#diamonds + 1] = new(GS(53), {
				Parent = b, AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(side, side == 0 and -16 or 16, 0.5, 0),
				Size = UDim2.fromOffset(7, 7), Rotation = 45, BackgroundColor3 = IC.gold, BorderSizePixel = 0,
			})
		end
	end

	local info = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
	local pinfo = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local rinfo = TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

	local function paint(mode)
		local bgT, stT, bgC
		if mode == "hover" then
			bgT, stT = math.max(0, S.bgT - 0.18), math.max(0, S.strokeT - 0.3)
			bgC = S.bg:Lerp(S.stroke, 0.18)
		elseif mode == "press" then
			bgT, stT = math.max(0, S.bgT - 0.3), math.max(0, S.strokeT - 0.4)
			bgC = S.bg:Lerp(S.stroke, 0.3)
		else
			bgT, stT, bgC = S.bgT, S.strokeT, S.bg
		end
		tween(b, info, { BackgroundTransparency = bgT, BackgroundColor3 = bgC })
		tween(st, info, { Transparency = stT })
	end

	b.MouseEnter:Connect(function()
		if touchOnly then return end
		paint("hover")
		if ic and o.iconHover then ic.set(o.iconHover) end
	end)
	b.MouseLeave:Connect(function()
		paint("idle")
		tween(sc, rinfo, { Scale = 1 })
		if ic and o.iconHover then ic.set(icColor) end
	end)
	b.MouseButton1Down:Connect(function()
		paint("press")
		tween(sc, pinfo, { Scale = 0.95 })
		if ic and o.iconHover then ic.set(o.iconHover) end
	end)
	b.MouseButton1Up:Connect(function()
		tween(sc, rinfo, { Scale = 1 })
		if touchOnly then
			paint("idle")
			if ic and o.iconHover then ic.set(icColor) end
		else
			paint("hover")
		end
	end)

	local h = { btn = b, label = lbl, icon = ic, stroke = st }
	function h.setStyle(name)
		S = STYLES[name] or S
		local c = o.textColor or S.text
		if lbl then lbl.TextColor3 = c end
		if ic and not o.iconColor then ic.set(c) end
		for _, d in ipairs(diamonds) do d.BackgroundColor3 = IC.gold end
		tween(st, info, { Color = S.stroke })
		paint("idle")
	end
	return h
end
local makeButton = _UI.button

function _UI.winButton(parent_, kind, xOff, accent)
	local b = new(GS(51), {
		Parent = parent_, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, xOff, 0.5, 0),
		Size = UDim2.fromOffset(28, 28), BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.45,
		AutoButtonColor = false, Text = "", BorderSizePixel = 0,
	})
	corner(b, 4)
	local st = stroke(b, IC.btnLine, 1, 0.65)
	local sc = new(GS(60), { Parent = b, Scale = 1 })
	local ic = _UI.icon(kind, b, IC.soft, 14)
	ic.root.AnchorPoint = Vector2.new(0.5, 0.5)
	ic.root.Position = UDim2.fromScale(0.5, 0.5)

	local info = TweenInfo.new(0.14, Enum.EasingStyle.Quad)
	local pinfo = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local rinfo = TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

	local function state(bgColor, bgT, strokeColor, strokeT, iconColor)
		tween(b, info, { BackgroundColor3 = bgColor, BackgroundTransparency = bgT })
		tween(st, info, { Color = strokeColor, Transparency = strokeT })
		ic.set(iconColor)
	end
	local function idle() state(IC.btnBg, 0.45, IC.btnLine, 0.65, IC.soft) end
	local function over() state(accent:Lerp(BLACK, 0.7), 0.15, accent, 0.2, WHITE) end

	b.MouseEnter:Connect(function()
		if touchOnly then return end
		over()
		if kind == "close" then
			tween(ic.root, rinfo, { Rotation = 90 })
		end
	end)
	b.MouseLeave:Connect(function()
		idle()
		tween(sc, rinfo, { Scale = 1 })
		tween(ic.root, rinfo, { Rotation = 0 })
	end)
	b.MouseButton1Down:Connect(function()
		over()
		tween(sc, pinfo, { Scale = 0.88 })
	end)
	b.MouseButton1Up:Connect(function()
		tween(sc, rinfo, { Scale = 1 })
		if touchOnly then
			idle()
		else
			over()
		end
	end)
	return b
end

function _UI.modal(host)
	local overlay = new(GS(53), {
		Parent = host, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK,
		BackgroundTransparency = 1, BorderSizePixel = 0, Active = true, Visible = false, ZIndex = 100,
	})
	local box = new(GS(53), {
		Parent = overlay, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(300, 142), BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.08,
		BorderSizePixel = 0, ZIndex = 101,
	})
	corner(box, 6)
	local boxStroke = stroke(box, WHITE, 1.2, 0.2)
	grad(boxStroke, IC.gold, IC.btnLine, 60)
	local scale = new(GS(60), { Parent = box, Scale = 0.9 })
	local title = new(GS(52), {
		Parent = box, Position = UDim2.fromOffset(14, 12), Size = UDim2.new(1, -28, 0, 26),
		BackgroundTransparency = 1, Text = "", Font = Enum.Font.Garamond,
		TextSize = 22, TextColor3 = IC.title, TextXAlignment = Enum.TextXAlignment._Lf, ZIndex = 102,
	})
	local text = new(GS(52), {
		Parent = box, Position = UDim2.fromOffset(14, 42), Size = UDim2.new(1, -28, 0, 34),
		BackgroundTransparency = 1, Text = "", Font = Enum.Font.Gotham, TextSize = 12,
		TextColor3 = IC.soft, TextWrapped = true, TextXAlignment = Enum.TextXAlignment._Lf,
		TextYAlignment = Enum.TextYAlignment.Top, ZIndex = 102,
	})
	local left = makeButton({
		parent = box, text = GS(285), size = UDim2.fromOffset(129, 34),
		pos = UDim2.fromOffset(14, 94), style = "dark", textSize = 13,
	})
	local right = makeButton({
		parent = box, text = GS(286), size = UDim2.fromOffset(129, 34),
		pos = UDim2.fromOffset(157, 94), style = "danger", textSize = 13,
	})
	for _, d in ipairs(box:GetDescendants()) do
		if d:IsA("GuiObject") and d.ZIndex < 102 then d.ZIndex = 102 end
	end

	local m = {}
	local cbLeft, cbRight
	local showToken = 0

	function m.show(o)
		showToken = showToken + 1
		title.Text = o.title or ""
		text.Text = o.text or ""
		left.label.Text = o.leftText or GS(285)
		right.label.Text = o.rightText or GS(286)
		left.setStyle(o.leftStyle or "dark")
		right.setStyle(o.rightStyle or "danger")
		cbLeft, cbRight = o.onLeft, o.onRight
		overlay.Visible = true
		tween(overlay, TweenInfo.new(0.2), { BackgroundTransparency = 0.45 })
		scale.Scale = 0.9
		tween(scale, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
	end

	function m.hide()
		showToken = showToken + 1
		local my = showToken
		tween(scale, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 })
		local t = tween(overlay, TweenInfo.new(0.18), { BackgroundTransparency = 1 })
		t.Completed:Connect(function()
			if showToken == my then overlay.Visible = false end
		end)
	end

	left.btn.MouseButton1Click:Connect(function()
		m.hide()
		if cbLeft then cbLeft() end
	end)
	right.btn.MouseButton1Click:Connect(function()
		m.hide()
		if cbRight then cbRight() end
	end)
	return m
end

local W, H = 540, 330
local vp0 = _UI.viewport()
local BASE = math.min(1, (vp0.Y - 24) / H, (vp0.X - 24) / W)

local _Rt = new(GS(53), {
	Parent = gui, BackgroundTransparency = 1, Active = true,
	Size = UDim2.fromOffset(W * BASE, H * BASE),
	Position = UDim2.fromOffset(math.floor((vp0.X - W * BASE) / 2), math.floor((vp0.Y - H * BASE) / 2)),
	Visible = false,
})

local _Wn = new(GS(56), {
	Parent = _Rt, AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(W, H),
	BackgroundColor3 = BLACK, BackgroundTransparency = 0, BorderSizePixel = 0,
	Active = true, GroupTransparency = 1,
})
corner(_Wn, 8)
local winStroke = stroke(_Wn, WHITE, 1.2, 0.2)
grad(winStroke, IC.gold, IC.btnLine, 60)
local winScale = new(GS(60), { Parent = _Wn, Scale = BASE * 0.6 })

local bgScale = _UI.background(_Wn, 0.5)

local _Tb = new(GS(53), {
	Parent = _Wn, Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1,
})
local headLine = new(GS(53), {
	Parent = _Wn, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 42),
	Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = IC.gold, BorderSizePixel = 0,
})
new(GS(59), {
	Parent = headLine,
	Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.5, 0.3),
		NumberSequenceKeypoint.new(1, 1),
	}),
})
local dragArea = new(GS(53), {
	Parent = _Tb, Size = UDim2.new(1, -86, 1, 0), BackgroundTransparency = 1, Active = true,
})

local logo = new(GS(53), {
	Parent = _Tb, Position = UDim2.fromOffset(12, 8), Size = UDim2.fromOffset(26, 26),
	BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true,
})
corner(logo, 8)
local logoImg = new(GS(54), {
	Parent = logo, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
	ScaleType = Enum.ScaleType.Crop, Image = "", BorderSizePixel = 0, ImageTransparency = 1,
})
corner(logoImg, 8)
_UI.logo(logoImg)

local titleMain = new(GS(52), {
	Parent = _Tb, Position = UDim2.fromOffset(48, 3), Size = UDim2.fromOffset(330, 24),
	BackgroundTransparency = 1, Text = GS(273), Font = Enum.Font.Garamond,
	TextSize = 22, TextColor3 = WHITE, TextXAlignment = Enum.TextXAlignment._Lf,
	TextStrokeTransparency = 0.88, TextStrokeColor3 = BLACK,
})
grad(titleMain, IC.title, IC.titleLow, 90)
new(GS(52), {
	Parent = _Tb, Position = UDim2.fromOffset(48, 25), Size = UDim2.fromOffset(330, 14),
	BackgroundTransparency = 1, Text = GS(274), Font = Enum.Font.Garamond,
	TextSize = 15, TextColor3 = IC.soft, TextXAlignment = Enum.TextXAlignment._Lf,
})

local btnMin = _UI.winButton(_Tb, "min", -44, IC.gold)
local btnClose = _UI.winButton(_Tb, "close", -10, T.red)

_UI.draggable(dragArea, _Rt)

local _Lf = new(GS(53), {
	Parent = _Wn, Position = UDim2.fromOffset(10, 52), Size = UDim2.fromOffset(190, 268),
	BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.4, BorderSizePixel = 0,
})
corner(_Lf, 6)
stroke(_Lf, IC.btnLine, 1, 0.65)

local previewHolder = new(GS(53), {
	Parent = _Lf, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(170, 170),
	BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.35, BorderSizePixel = 0, ClipsDescendants = true,
})
corner(previewHolder, 6)
local prevStroke = stroke(previewHolder, WHITE, 1, 0.3)
grad(prevStroke, IC.gold, IC.btnLine, 45)
local _pv = new(GS(54), {
	Parent = previewHolder, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
	Image = "", ScaleType = Enum.ScaleType.Fit, BorderSizePixel = 0,
})
local previewHint = new(GS(52), {
	Parent = previewHolder, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
	Text = GS(275), Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = IC.soft,
})

local nameLabel = new(GS(52), {
	Parent = _Lf, Position = UDim2.fromOffset(10, 188), Size = UDim2.fromOffset(170, 20),
	BackgroundTransparency = 1, Text = "-", Font = Enum.Font.GothamBold, TextSize = 14,
	TextColor3 = IC.title, TextXAlignment = Enum.TextXAlignment._Lf, TextTruncate = Enum.TextTruncate.AtEnd,
})
local idChip = new(GS(53), {
	Parent = _Lf, Position = UDim2.fromOffset(10, 210), Size = UDim2.fromOffset(0, 16),
	AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = IC.btnBgMain, BackgroundTransparency = 0.45,
	BorderSizePixel = 0,
})
corner(idChip, 4)
new(GS(62), { Parent = idChip, PaddingLeft = UDim.new(0, 7), PaddingRight = UDim.new(0, 7) })
local idLabel = new(GS(52), {
	Parent = idChip, Size = UDim2.fromOffset(0, 16), AutomaticSize = Enum.AutomaticSize.X,
	BackgroundTransparency = 1, Text = "ID: -", Font = Enum.Font.GothamMedium, TextSize = 10,
	TextColor3 = IC.gold,
})

local statusDot = new(GS(53), {
	Parent = _Lf, Position = UDim2.fromOffset(12, 238), Size = UDim2.fromOffset(6, 6),
	BackgroundColor3 = IC.soft, BorderSizePixel = 0,
})
corner(statusDot, 3)
local _sl = new(GS(52), {
	Parent = _Lf, Position = UDim2.fromOffset(24, 232), Size = UDim2.fromOffset(156, 24),
	BackgroundTransparency = 1, Text = GS(276), Font = Enum.Font.Gotham,
	TextSize = 11, TextColor3 = IC.soft, TextWrapped = true, TextTruncate = Enum.TextTruncate.AtEnd,
	TextXAlignment = Enum.TextXAlignment._Lf, TextYAlignment = Enum.TextYAlignment.Top,
})
local progressTrack = new(GS(53), {
	Parent = _Lf, Position = UDim2.fromOffset(10, 260), Size = UDim2.fromOffset(170, 3),
	BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.3, BorderSizePixel = 0, ClipsDescendants = true,
})
corner(progressTrack, 2)
local _pf = new(GS(53), {
	Parent = progressTrack, Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = WHITE, BorderSizePixel = 0,
})
corner(_pf, 2)
grad(_pf, IC.gold, IC.goldLight, 0)

local function setStatus(text, color)
	_sl.Text = text
	_sl.TextColor3 = color or IC.soft
	statusDot.BackgroundColor3 = color or IC.soft
end

local function setProgress(p)
	tween(_pf, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
		Size = UDim2.new(math.clamp(p, 0, 1), 0, 1, 0),
	})
end

local _Rg = new(GS(53), {
	Parent = _Wn, Position = UDim2.fromOffset(210, 52), Size = UDim2.fromOffset(320, 268),
	BackgroundTransparency = 1,
})

local inputBox = new(GS(53), {
	Parent = _Rg, Size = UDim2.fromOffset(240, 36), BackgroundColor3 = IC.btnBg,
	BackgroundTransparency = 0.4, BorderSizePixel = 0,
})
corner(inputBox, 4)
local inputStroke = stroke(inputBox, IC.btnLine, 1, 0.55)
local searchIcon = _UI.icon("search", inputBox, IC.soft, 15)
searchIcon.root.Position = UDim2.fromOffset(10, 10)
local input = new(GS(64), {
	Parent = inputBox, Position = UDim2.fromOffset(32, 0), Size = UDim2.new(1, -42, 1, 0),
	BackgroundTransparency = 1, BorderSizePixel = 0, Text = "", PlaceholderText = GS(284),
	PlaceholderColor3 = IC.soft, TextColor3 = IC.title, Font = Enum.Font.GothamMedium,
	TextSize = 13, ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment._Lf,
	ClipsDescendants = true,
})
input.Focused:Connect(function()
	tween(inputStroke, TweenInfo.new(0.15), { Color = IC.gold, Transparency = 0.2 })
	searchIcon.set(IC.gold)
end)
input.FocusLost:Connect(function()
	tween(inputStroke, TweenInfo.new(0.15), { Color = IC.btnLine, Transparency = 0.55 })
	searchIcon.set(IC.soft)
end)

local btnSearch = makeButton({
	parent = _Rg, text = GS(277), size = UDim2.fromOffset(74, 36),
	pos = UDim2.fromOffset(246, 0), style = "main", textSize = 12,
})

local btnCopy = makeButton({
	parent = _Rg, text = GS(278), icon = "copy", size = UDim2.fromOffset(102, 34),
	pos = UDim2.fromOffset(0, 44), style = "main",
})
local btnSave = makeButton({
	parent = _Rg, text = GS(279), icon = "plus", size = UDim2.fromOffset(102, 34),
	pos = UDim2.fromOffset(109, 44), style = "dark",
})
local btnFav = makeButton({
	parent = _Rg, text = GS(280), icon = "star", size = UDim2.fromOffset(102, 34),
	pos = UDim2.fromOffset(218, 44), style = "dark",
})
btnFav.icon.set(T.warn)

local tabBar = new(GS(53), {
	Parent = _Rg, Position = UDim2.fromOffset(0, 86), Size = UDim2.fromOffset(200, 30),
	BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.4, BorderSizePixel = 0,
})
corner(tabBar, 4)
stroke(tabBar, IC.btnLine, 1, 0.65)

local tabStrokes = {}
local function makeTab(text, x, key)
	local t = new(GS(51), {
		Parent = tabBar, Position = UDim2.fromOffset(x, 3), Size = UDim2.fromOffset(96, 24),
		BackgroundColor3 = IC.btnBgMain, BackgroundTransparency = 1, AutoButtonColor = false,
		Text = text, Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = IC.soft, BorderSizePixel = 0,
	})
	corner(t, 3)
	tabStrokes[key] = stroke(t, IC.gold, 1, 1)
	return t
end
local tabSaved = makeTab(GS(281), 3, "saved")
local tabFavs = makeTab(GS(282), 101, "favs")

local btnRestore = makeButton({
	parent = _Rg, text = GS(283), icon = "back", size = UDim2.fromOffset(114, 30),
	pos = UDim2.fromOffset(206, 86), style = "dark", textSize = 11,
})

local _lf = new(GS(63), {
	Parent = _Rg, Position = UDim2.fromOffset(0, 124), Size = UDim2.fromOffset(320, 144),
	BackgroundColor3 = IC.btnBg, BackgroundTransparency = 0.4, BorderSizePixel = 0, ScrollBarThickness = 3,
	ScrollBarImageColor3 = IC.gold, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y, ClipsDescendants = true,
})
corner(_lf, 6)
stroke(_lf, IC.btnLine, 1, 0.65)
new(GS(62), {
	Parent = _lf, PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6),
	PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6),
})
new(GS(61), { Parent = _lf, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder })

local _Md = _UI.modal(_Wn)

local _cur = nil
local _bsy = false
local _apl = false
local _tc = {}
local _pid = nil

local function getThumb(id, ttype, size)
	for i = 1, 4 do
		local ok, content, ready = pcall(Players.GetUserThumbnailAsync, Players, id, ttype, size)
		if ok and content and content ~= "" and (ready or i == 4) then return content end
		task.wait(0.25)
	end
end

local function headThumb(id)
	if _tc[id] then return _tc[id] end
	local c = getThumb(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	_tc[id] = c
	return c
end

local function resolveUser(text)
	text = string.match(text or "", "^%s*(.-)%s*$")
	if text == "" then return nil, GS(276) end
	local id, name
	if text:match("^%d+$") then
		id = tonumber(text)
		local ok, n = pcall(Players.GetNameFromUserIdAsync, Players, id)
		if ok then
			name = n
		else
			local ok2, id2 = pcall(Players.GetUserIdFromNameAsync, Players, text)
			if ok2 then id = id2 else return nil, GS(303) end
		end
	else
		local ok, uid = pcall(Players.GetUserIdFromNameAsync, Players, text)
		if not ok then return nil, GS(304) end
		id = uid
	end
	if not name then
		local ok, n = pcall(Players.GetNameFromUserIdAsync, Players, id)
		name = ok and n or text
	end
	return id, name
end

local LEG_NAMES = {
	LeftFoot = true, RightFoot = true, LeftLowerLeg = true, RightLowerLeg = true,
	["_Lf Leg"] = true, ["_Rg Leg"] = true,
}

local STD_PARTS = {}
for _, n in ipairs({
	"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand",
	"RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
	"RightUpperLeg", "RightLowerLeg", "RightFoot", "Torso", "_Lf Arm", "_Rg Arm", "_Lf Leg", "_Rg Leg",
}) do
	STD_PARTS[n] = true
end

local _St = {
	template = nil, desc = nil, shell = nil, sRoot = nil, shellParts = {}, char = nil,
	conns = {}, hidden = {}, pairList = {}, offset = CFrame.new(), fp = false, lastScan = 0,
	sAnimator = nil, mirror = {}, animActive = false, c0Dirty = false,
}

local _Bd = {}
local _Bo = {}
local MAX_BUILDS = 4

local function loadAsset(id)
	local obj
	local ok = pcall(function() obj = game:GetObjects(GS(333) .. id)[1] end)
	if ok and obj then return obj end
	ok = pcall(function() obj = game:GetService(GS(71)):LoadAsset(id) end)
	if ok and obj then return obj end
end

local function findClass(obj, class)
	if not obj then return nil end
	if obj:IsA(class) then return obj end
	return obj:FindFirstChildWhichIsA(class, true)
end

local function preload(model)
	local list = {}
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(GS(222)) or d:IsA(GS(223)) or d:IsA(GS(220)) or d:IsA(GS(224))
			or d:IsA(GS(225)) or d:IsA(GS(217)) or d:IsA(GS(218)) or d:IsA(GS(219)) then
			list[#list + 1] = d
		end
	end
	if #list == 0 then return end
	withTimeout(15, function() ContentProvider:PreloadAsync(list) end)
end

local function buildFromAssets(desc)
	local model = Instance.new("Model")
	model.Name = "AvatarSource"
	local pending = 0
	local function async(fn)
		pending = pending + 1
		task.spawn(function()
			pcall(fn)
			pending = pending - 1
		end)
	end

	local bc = Instance.new(GS(210))
	bc.HeadColor3 = desc.HeadColor
	bc.TorsoColor3 = desc.TorsoColor
	bc.LeftArmColor3 = desc.LeftArmColor
	bc.RightArmColor3 = desc.RightArmColor
	bc.LeftLegColor3 = desc.LeftLegColor
	bc.RightLegColor3 = desc.RightLegColor
	bc.Parent = model

	local function loadInto(id, class, rename)
		if id and id > 0 then
			async(function()
				local o = findClass(loadAsset(id), class)
				if o then
					if rename then o.Name = rename end
					o.Parent = model
				end
			end)
		end
	end
	loadInto(desc.Shirt, GS(217))
	loadInto(desc.Pants, GS(218))
	loadInto(desc.GraphicTShirt, GS(219))
	loadInto(desc.Face, GS(220), GS(221))

	local okA, accs = pcall(function() return desc:GetAccessories(true) end)
	if okA and type(accs) == "table" then
		for _, a in ipairs(accs) do
			if a.AssetId and a.AssetId > 0 then
				async(function()
					local acc = findClass(loadAsset(a.AssetId), GS(206))
					if acc then
						local wl = acc:FindFirstChildWhichIsA(GS(207), true)
						if wl then
							if a.Order then wl.Order = a.Order end
							if a.Puffiness then wl.Puffiness = a.Puffiness end
						end
						acc.Parent = model
					end
				end)
			end
		end
	end

	local t0 = os.clock()
	while pending > 0 and os.clock() - t0 < 25 do task.wait(0.05) end
	return model
end

local function attachByAttachments(model, acc)
	local handle = acc:FindFirstChild(GS(205))
	if not handle or not handle:IsA(GS(235)) then
		acc.Parent = model
		return false
	end
	for _, d in ipairs(handle:GetChildren()) do
		if d:IsA(GS(203)) or d:IsA(GS(197)) or d:IsA("WeldConstraint") then d:Destroy() end
	end
	for _, a in ipairs(handle:GetChildren()) do
		if a:IsA(GS(204)) then
			local target
			for _, p in ipairs(model:GetChildren()) do
				if p:IsA(GS(235)) then
					local t = p:FindFirstChild(a.Name)
					if t and t:IsA(GS(204)) then
						target = t
						break
					end
				end
			end
			if target then
				local w = Instance.new(GS(203))
				w.Name = "AccessoryWeld"
				w.Part0 = handle
				w.Part1 = target.Parent
				w.C0 = a.CFrame
				w.C1 = target.CFrame
				w.Parent = handle
				acc.Parent = model
				return true
			end
		end
	end
	acc.Parent = model
	return false
end

local function prepShell(model)
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(GS(226)) or d:IsA(GS(227)) or d:IsA(GS(228))
			or d:IsA(GS(229)) or d:IsA(GS(230)) or d:IsA(GS(231)) then
			pcall(function() d:Destroy() end)
		end
	end
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(GS(235)) then
			pcall(function()
				d.Anchored = false
				d.CanCollide = false
				d.CanTouch = false
				d.CanQuery = false
				d.Massless = true
			end)
		end
	end
	local root = model:FindFirstChild(GS(14))
	if root then root.Anchored = true end
	local h = model:FindFirstChildOfClass(GS(15))
	if h then
		pcall(function() h.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None end)
		pcall(function() h.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff end)
		pcall(function() h.BreakJointsOnDeath = false end)
		pcall(function() h.RequiresNeck = false end)
		pcall(function() h.EvaluateStateMachine = false end)
		pcall(function() h.AutoRotate = false end)
		pcall(function() h.WalkSpeed = 0 end)
	end
end

local function templateFromDescription(desc, rig)
	for attempt = 1, 3 do
		local m = withTimeout(30, function()
			return Players:CreateHumanoidModelFromDescription(desc, rig)
		end)
		if typeof(m) == GS(37) then
			local h = m:FindFirstChildOfClass(GS(15))
			if m:FindFirstChild(GS(14)) and h and h.RigType == rig then
				return m
			end
			pcall(function() m:Destroy() end)
		end
		task.wait(0.3)
	end
	return nil
end

local function templateFromAssets(desc, char)
	local base
	local okc = pcall(function()
		char.Archivable = true
		for _, d in ipairs(char:GetDescendants()) do
			pcall(function() d.Archivable = true end)
		end
		for inst, t in pairs(_St.hidden) do
			if inst.Parent then inst.Transparency = t end
		end
		base = char:Clone()
		for inst in pairs(_St.hidden) do
			if inst.Parent then inst.Transparency = 1 end
		end
	end)
	if not okc or not base then return nil end

	for _, d in ipairs(base:GetDescendants()) do
		if d:IsA(GS(226)) or d:IsA(GS(227)) or d:IsA(GS(233))
			or d:IsA(GS(234)) or d:IsA(GS(230)) or d:IsA(GS(231))
			or d:IsA(GS(232)) or d:IsA(GS(228)) then
			pcall(function() d:Destroy() end)
		end
	end

	local src = buildFromAssets(desc)
	for _, c in ipairs(src:GetChildren()) do
		if c:IsA(GS(234)) then c.Parent = base end
	end
	local head = base:FindFirstChild("Head")
	local face = src:FindFirstChild(GS(221))
	if head and face then
		for _, d in ipairs(head:GetChildren()) do
			if d:IsA(GS(220)) then d:Destroy() end
		end
		face.Parent = head
	end
	for _, a in ipairs(src:GetChildren()) do
		if a:IsA(GS(233)) then attachByAttachments(base, a) end
	end
	pcall(function() src:Destroy() end)
	return base
end

local function lowestLeg(model)
	local root = model:FindFirstChild(GS(14))
	if not root then return nil end
	local cf = { [root] = CFrame.identity }
	local joints = {}
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(GS(197)) and d.Part0 and d.Part1 then joints[#joints + 1] = d end
	end
	local changed, guard = true, 0
	while changed and guard < 30 do
		changed = false
		guard = guard + 1
		for _, j in ipairs(joints) do
			local a, b = j.Part0, j.Part1
			if cf[a] and not cf[b] then
				cf[b] = cf[a] * j.C0 * j.C1:Inverse()
				changed = true
			elseif cf[b] and not cf[a] then
				cf[a] = cf[b] * j.C1 * j.C0:Inverse()
				changed = true
			end
		end
	end
	local low
	for p, c in pairs(cf) do
		if LEG_NAMES[p.Name] and p.Parent == model then
			local s = p.Size
			local ext = 0.5 * (math.abs(c.RightVector.Y) * s.X + math.abs(c.UpVector.Y) * s.Y + math.abs(c.LookVector.Y) * s.Z)
			local y = c.Position.Y - ext
			if not low or y < low then low = y end
		end
	end
	return low
end

local function hideReal(char)
	local function hide(p)
		if _St.hidden[p] == nil then _St.hidden[p] = p.Transparency end
		if p.Transparency ~= 1 then p.Transparency = 1 end
	end
	for _, c in ipairs(char:GetChildren()) do
		if c:IsA(GS(235)) and c.Name ~= GS(14) then
			hide(c)
		elseif c:IsA(GS(233)) then
			for _, d in ipairs(c:GetDescendants()) do
				if d:IsA(GS(235)) then hide(d) end
			end
		end
	end
end

local function setShellLTM(v)
	for _, p in ipairs(_St.shellParts) do
		pcall(function() p.LocalTransparencyModifier = v end)
	end
end

local function unmount()
	for _, c in ipairs(_St.conns) do pcall(function() c:Disconnect() end) end
	_St.conns = {}
	if _St.shell then
		pcall(function() _St.shell:Destroy() end)
	end
	for inst, t in pairs(_St.hidden) do
		if inst.Parent then pcall(function() inst.Transparency = t end) end
	end
	_St.shell, _St.sRoot, _St.char = nil, nil, nil
	_St.shellParts, _St.hidden, _St.pairList = {}, {}, {}
	_St.mirror, _St.sAnimator, _St.animActive, _St.c0Dirty = {}, nil, false, false
	_St.fp = false
end

local function noCollide()
	for _, p in ipairs(_St.shellParts) do
		if p.CanCollide then p.CanCollide = false end
		if p.CanTouch then p.CanTouch = false end
		if p.CanQuery then p.CanQuery = false end
	end
end

local function poseTransform(rm)
	local p0, p1 = rm.Part0, rm.Part1
	if p0 and p1 then
		return (p0.CFrame * rm.C0):Inverse() * (p1.CFrame * rm.C1)
	end
	return rm.Transform
end

local function resetC0()
	for _, pr in ipairs(_St.pairList) do
		local sm = pr[2]
		if sm.Parent then sm.C0 = pr[3] end
	end
	_St.c0Dirty = false
end

local function syncPose()
	local shell, char = _St.shell, _St.char
	if not shell or not char or not char.Parent then return end
	if _St.animActive then
		if _St.c0Dirty then resetC0() end
		return
	end
	for _, pr in ipairs(_St.pairList) do
		local rm, sm, baseC0 = pr[1], pr[2], pr[3]
		if rm.Parent and sm.Parent then
			local ok, tr = pcall(poseTransform, rm)
			if ok and tr then
				sm.C0 = baseC0 * tr
			end
		end
	end
	_St.c0Dirty = true
end

local function mirrorAnimations()
	local char, shell, sAnim = _St.char, _St.shell, _St.sAnimator
	if not char or not shell or not sAnim or not sAnim.Parent then
		_St.animActive = false
		return
	end
	local rHum = char:FindFirstChildOfClass(GS(15))
	local rAnim = rHum and rHum:FindFirstChildOfClass(GS(16))
	if not rAnim then
		_St.animActive = false
		return
	end
	local okT, tracks = pcall(function() return rAnim:GetPlayingAnimationTracks() end)
	if not okT or type(tracks) ~= "table" then
		_St.animActive = false
		return
	end

	local seen, count = {}, 0
	for _, rt in ipairs(tracks) do
		local anim = rt.Animation
		if anim and anim.AnimationId ~= "" then
			seen[rt] = true
			local m = _St.mirror[rt]
			if not m then
				local ok, st = pcall(function() return sAnim:LoadAnimation(anim) end)
				if ok and st then
					m = st
					_St.mirror[rt] = st
					pcall(function()
						st.Priority = rt.Priority
						st.Looped = rt.Looped
						st:Play(0.1, math.max(rt.WeightCurrent, 0.01), rt.Speed)
					end)
				end
			end
			if m then
				pcall(function()
					if not m.IsPlaying then
						m:Play(0.1, math.max(rt.WeightCurrent, 0.01), rt.Speed)
					end
					m.Priority = rt.Priority
					m.Looped = rt.Looped
					m:AdjustWeight(math.max(rt.WeightCurrent, 0.01), 0)
					m:AdjustSpeed(rt.Speed)
					local len = rt.Length
					if len and len > 0 then
						local d = math.abs(m.TimePosition - rt.TimePosition)
						if rt.Looped then d = math.min(d, len - d) end
						if d > 0.25 then m.TimePosition = rt.TimePosition end
					end
				end)
				count = count + 1
			end
		end
	end

	for rt, st in pairs(_St.mirror) do
		if not seen[rt] then
			pcall(function() st:Stop(0.1) end)
			_St.mirror[rt] = nil
		end
	end

	_St.animActive = count > 0
end

local function onStep()
	local shell, char, sRoot = _St.shell, _St.char, _St.sRoot
	if not shell or not char or not sRoot or not char.Parent then return end
	local hrp = char:FindFirstChild(GS(14))
	if not hrp then return end

	local want = workspace.CurrentCamera or workspace
	if shell.Parent ~= want then shell.Parent = want end

	for inst in pairs(_St.hidden) do
		if inst.Parent and inst.Transparency ~= 1 then inst.Transparency = 1 end
	end

	noCollide()

	sRoot.CFrame = hrp.CFrame * _St.offset

	mirrorAnimations()
	syncPose()

	local now = os.clock()
	if now - _St.lastScan > 0.3 then
		_St.lastScan = now
		hideReal(char)
	end

	local cam = workspace.CurrentCamera
	local head = char:FindFirstChild("Head")
	if cam and head then
		local fp = (cam.CFrame.Position - head.Position).Magnitude < 1.6
		if fp ~= _St.fp then
			_St.fp = fp
			setShellLTM(fp and 1 or 0)
		end
	end
end

local function mount(char, hum, template)
	unmount()
	local hrp = char:FindFirstChild(GS(14))
	if not hrp then return false, GS(329) end

	local shell = template:Clone()
	shell.Name = _sn
	local sRoot = shell:FindFirstChild(GS(14))
	if not sRoot then
		shell:Destroy()
		return false, GS(330)
	end

	local sh = shell:FindFirstChildOfClass(GS(15))
	local sAnimator
	if sh then
		pcall(function() sh.WalkSpeed = 0 end)
		pcall(function() sh.JumpPower = 0 end)
		pcall(function() sh.AutoRotate = false end)
		sAnimator = sh:FindFirstChildOfClass(GS(16))
		if not sAnimator then
			sAnimator = Instance.new(GS(16))
			sAnimator.Parent = sh
		end
	end

	local list = {}
	for _, rm in ipairs(char:GetDescendants()) do
		if rm:IsA(GS(197)) and rm.Parent and rm.Parent.Parent == char then
			local sp = shell:FindFirstChild(rm.Parent.Name)
			local sm = sp and sp:FindFirstChild(rm.Name)
			if sm and sm:IsA(GS(197)) then
				list[#list + 1] = { rm, sm, sm.C0 }
			end
		end
	end

	local dy = 0
	local lowR, lowS = lowestLeg(char), lowestLeg(shell)
	if lowR and lowS then dy = math.clamp(lowR - lowS, -8, 8) end

	_St.offset = CFrame.new(0, dy, 0)
	sRoot.Anchored = true
	shell.PrimaryPart = sRoot
	shell:PivotTo(hrp.CFrame * _St.offset)

	local parts = {}
	for _, d in ipairs(shell:GetDescendants()) do
		if d:IsA(GS(235)) then
			pcall(function()
				d.CanCollide = false
				d.CanTouch = false
				d.CanQuery = false
				d.Massless = true
			end)
			parts[#parts + 1] = d
		end
	end

	_St.shell, _St.sRoot, _St.char = shell, sRoot, char
	_St.sAnimator, _St.mirror, _St.animActive, _St.c0Dirty = sAnimator, {}, false, false
	_St.shellParts, _St.pairList = parts, list
	_St.fp = false
	shell.Parent = workspace.CurrentCamera or workspace

	hideReal(char)
	_St.lastScan = os.clock()
	_St.conns[#_St.conns + 1] = RunService.RenderStepped:Connect(onStep)
	_St.conns[#_St.conns + 1] = RunService.Stepped:Connect(function()
		noCollide()
		syncPose()
	end)
	_St.conns[#_St.conns + 1] = RunService.Heartbeat:Connect(function()
		noCollide()
		syncPose()
	end)
	return true
end

local function verifyShell(char)
	local missing = {}
	local shell = _St.shell
	if not shell then return { "sin modelo" } end
	for _, c in ipairs(char:GetChildren()) do
		if c:IsA(GS(235)) and STD_PARTS[c.Name] and not shell:FindFirstChild(c.Name) then
			missing[#missing + 1] = c.Name
		end
	end
	if #_St.pairList == 0 then missing[#missing + 1] = "uniones" end
	return missing
end

local function buildTemplate(desc, rig, char)
	local template, mode = templateFromDescription(desc, rig), "model"
	if not template then
		template, mode = templateFromAssets(desc, char), "assets"
	end
	if not template then return nil end

	prepShell(template)
	preload(template)
	return template, mode
end

local function evictBuilds()
	while #_Bo > MAX_BUILDS do
		local victim
		for i, id in ipairs(_Bo) do
			local b = _Bd[id]
			if b and b.state ~= "building" and b.template ~= _St.template then
				victim = i
				break
			end
		end
		if not victim then return end
		local id = table.remove(_Bo, victim)
		local b = _Bd[id]
		_Bd[id] = nil
		if b and b.template then pcall(function() b.template:Destroy() end) end
	end
end

local function ensureBuild(entry)
	local char = _lp.Character
	local hum = char and char:FindFirstChildOfClass(GS(15))
	if not hum then return nil end
	local rig = hum.RigType

	local b = _Bd[entry.id]
	if b and b.rig == rig and b.state ~= "failed" then return b end
	if b then
		local i = table.find(_Bo, entry.id)
		if i then table.remove(_Bo, i) end
		if b.template and b.template ~= _St.template then
			pcall(function() b.template:Destroy() end)
		end
	end

	b = { state = "building", rig = rig }
	_Bd[entry.id] = b
	_Bo[#_Bo + 1] = entry.id

	task.spawn(function()
		local ok, t, mode = pcall(buildTemplate, entry.desc, rig, char)
		if ok and t then
			b.template, b.mode, b.state = t, mode, "ready"
		else
			b.state = "failed"
		end
		evictBuilds()
	end)
	return b
end

local function search(text)
	if _bsy then return false end
	_bsy = true
	setStatus(GS(302), IC.soft)
	setProgress(0.2)
	local id, name = resolveUser(text)
	if not id then
		setStatus(name, T.red)
		setProgress(0)
		_bsy = false
		return false
	end

	_pid = id
	_pv.Image = ""
	_pv.ImageTransparency = 0
	previewHint.Text = GS(316)
	previewHint.Visible = true
	task.spawn(function()
		local img = getThumb(id, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
		if _pid == id then
			if img then
				_pv.ImageTransparency = 1
				_pv.Image = img
				tween(_pv, TweenInfo.new(0.25, Enum.EasingStyle.Quad), { ImageTransparency = 0 })
			else
				_pv.Image = ""
			end
			previewHint.Text = GS(317)
			previewHint.Visible = not img
		end
	end)

	local desc
	for _ = 1, 3 do
		local ok, d = pcall(Players.GetHumanoidDescriptionFromUserId, Players, id)
		if ok and d then
			desc = d
			break
		end
		task.wait(0.3)
	end
	if not desc then
		setStatus(GS(305), T.red)
		setProgress(0)
		_bsy = false
		return false
	end

	_cur = { id = id, name = name, desc = desc }
	nameLabel.Text = name
	idLabel.Text = "ID: " .. tostring(id)
	setStatus(GS(306), T.green)
	setProgress(1)
	task.delay(0.6, function() setProgress(0) end)

	ensureBuild(_cur)

	_bsy = false
	return true
end

local function applyAvatar(entry)
	local char = _lp.Character
	local hum = char and char:FindFirstChildOfClass(GS(15))
	local hrp = char and char:FindFirstChild(GS(14))
	if not hum or not hrp then return false, GS(326) end
	local rig = hum.RigType

	local b = ensureBuild(entry)
	if not b then return false, GS(326) end

	if b.state == "building" then
		setStatus(GS(324), IC.soft)
		local t0 = os.clock()
		while b.state == "building" do
			setProgress(math.min(0.85, 0.15 + (os.clock() - t0) / 20))
			task.wait(0.1)
		end
	end
	if b.state ~= "ready" or not b.template then
		_Bd[entry.id] = nil
		local i = table.find(_Bo, entry.id)
		if i then table.remove(_Bo, i) end
		return false, GS(328)
	end
	local template, mode = b.template, b.mode
	setProgress(0.9)

	char = _lp.Character
	hum = char and char:FindFirstChildOfClass(GS(15))
	hrp = char and char:FindFirstChild(GS(14))
	if not hum or not hrp then return false, GS(327) end

	_St.template = template
	_St.desc = entry.desc

	setStatus(GS(325), IC.soft)

	local ok, err = mount(char, hum, template)
	if not ok then return false, tostring(err) end

	setProgress(1)
	task.delay(0.6, function() setProgress(0) end)

	local note = ""
	if rig ~= Enum.HumanoidRigType.R15 then note = note .. " | R6" end
	if mode == "assets" then note = note .. " | basico" end
	local missing = verifyShell(char)
	if #missing > 0 then
		note = note .. " | " .. #missing .. " avisos"
	end
	return true, note
end

local function restoreAvatar()
	unmount()
	_St.template, _St.desc = nil, nil
end

local function copyCurrent()
	if _apl then return end
	if not _cur then setStatus(GS(307), T.warn) return end
	_apl = true
	local cur = _cur
	setStatus(GS(318), IC.soft)
	local ok, success, info = pcall(applyAvatar, cur)
	if not ok then
		setStatus(GS(320) .. tostring(success), T.red)
		setProgress(0)
	elseif success then
		setStatus(GS(319) .. cur.name .. info, T.green)
	else
		setStatus(tostring(info), T.red)
		setProgress(0)
	end
	_apl = false
end

track(_lp.CharacterAdded:Connect(function(char)
	unmount()
	local hum = char:WaitForChild(GS(15), 15)
	if not hum then return end
	local hrp = char:WaitForChild(GS(14), 15)
	if not hrp then return end
	char:WaitForChild("Animate", 4)
	task.wait(0.4)
	if _lp.Character ~= char or not _St.template then return end
	while _apl do do local _j=_junk() task.wait(0.2) end end
	local th = _St.template:FindFirstChildOfClass(GS(15))
	if not th or th.RigType ~= hum.RigType then return end
	local ok = mount(char, hum, _St.template)
	if ok then
		setStatus(GS(323), T.green)
	end
end))

local _at = "saved"
local refreshList

local function indexOf(list, id)
	for i, e in ipairs(list) do
		if e.id == id then return i end
	end
end

local function addTo(listName)
	if not _cur then setStatus(GS(307), T.warn) return end
	local list = data[listName]
	if indexOf(list, _cur.id) then
		setStatus("Ya esta en " .. (listName == "saved" and "guardados." or "favoritos."), T.warn)
		return
	end
	table.insert(list, { id = _cur.id, name = _cur.name })
	saveData()
	refreshList()
	setStatus((listName == "saved" and GS(310) or GS(311)) .. _cur.name, T.green)
end

local function removeFrom(listName, id)
	local i = indexOf(data[listName], id)
	if i then
		table.remove(data[listName], i)
		saveData()
		refreshList()
		setStatus(GS(312), IC.soft)
	end
end

local function confirmRemove(listName, entry)
	_Md.show({
		title = GS(297),
		text = GS(298) .. entry.name .. " de " .. (listName == "saved" and "tus guardados." or "tus favoritos."),
		leftText = GS(285), leftStyle = "dark",
		rightText = GS(301), rightStyle = "danger",
		onRight = function() removeFrom(listName, entry.id) end,
	})
end

local function useEntry(entry)
	if search(tostring(entry.id)) then copyCurrent() end
end

local ROW_W = 300

local function buildRow(entry, listName, order)
	local row = new(GS(53), {
		Parent = _lf, Size = UDim2.fromOffset(ROW_W, 42), BackgroundColor3 = IC.btnBg,
		BackgroundTransparency = 0.35, BorderSizePixel = 0, LayoutOrder = order,
	})
	corner(row, 4)
	stroke(row, IC.btnLine, 1, 0.7)

	local thumb = new(GS(54), {
		Parent = row, Position = UDim2.fromOffset(6, 6), Size = UDim2.fromOffset(30, 30),
		BackgroundColor3 = IC.btnBg, BorderSizePixel = 0, Image = "", ImageTransparency = 1,
		ScaleType = Enum.ScaleType.Crop,
	})
	corner(thumb, 15)
	stroke(thumb, IC.gold, 1, 0.5)
	local cachedThumb = _tc[entry.id]
	if cachedThumb then
		thumb.Image = cachedThumb
		thumb.ImageTransparency = 0
	else
		task.spawn(function()
			local c = headThumb(entry.id)
			if c and thumb.Parent then
				thumb.Image = c
				tween(thumb, TweenInfo.new(0.2, Enum.EasingStyle.Quad), { ImageTransparency = 0 })
			end
		end)
	end

	local btnsW = listName == "saved" and 110 or 78
	local nameW = ROW_W - 44 - btnsW - 10
	new(GS(52), {
		Parent = row, Position = UDim2.fromOffset(44, 5), Size = UDim2.fromOffset(nameW, 18),
		BackgroundTransparency = 1, Text = entry.name, Font = Enum.Font.GothamBold, TextSize = 12,
		TextColor3 = IC.title, TextXAlignment = Enum.TextXAlignment._Lf, TextTruncate = Enum.TextTruncate.AtEnd,
	})
	new(GS(52), {
		Parent = row, Position = UDim2.fromOffset(44, 22), Size = UDim2.fromOffset(nameW, 14),
		BackgroundTransparency = 1, Text = tostring(entry.id), Font = Enum.Font.Gotham, TextSize = 10,
		TextColor3 = IC.soft, TextXAlignment = Enum.TextXAlignment._Lf, TextTruncate = Enum.TextTruncate.AtEnd,
	})

	local box = new(GS(53), {
		Parent = row, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0),
		Size = UDim2.fromOffset(btnsW, 28), BackgroundTransparency = 1,
	})
	new(GS(61), {
		Parent = box, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 4),
		HorizontalAlignment = Enum.HorizontalAlignment._Rg, VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local use = makeButton({
		parent = box, text = GS(315), size = UDim2.fromOffset(46, 28), style = "main",
		textSize = 11, order = 1, radius = 4,
	})
	use.btn.MouseButton1Click:Connect(function() task.spawn(useEntry, entry) end)

	if listName == "saved" then
		local inFavs = indexOf(data.favs, entry.id) ~= nil
		local fav = makeButton({
			parent = box, icon = "star", iconSize = 15, size = UDim2.fromOffset(28, 28),
			style = "dark", order = 2, radius = 4,
		})
		fav.icon.set(inFavs and T.warn or IC.soft)
		fav.btn.MouseButton1Click:Connect(function()
			if indexOf(data.favs, entry.id) then
				setStatus(GS(309), T.warn)
			else
				table.insert(data.favs, { id = entry.id, name = entry.name })
				saveData()
				refreshList()
				setStatus(GS(311) .. entry.name, T.green)
			end
		end)
	end

	local del = makeButton({
		parent = box, icon = "trash", iconSize = 16, size = UDim2.fromOffset(28, 28),
		style = "danger", iconColor = T.red, iconHover = WHITE, order = 3, radius = 4,
	})
	del.btn.MouseButton1Click:Connect(function() confirmRemove(listName, entry) end)
end

function refreshList()
	for _, c in ipairs(_lf:GetChildren()) do
		if c:IsA(GS(53)) or c:IsA(GS(52)) then c:Destroy() end
	end
	local list = data[_at]
	tabSaved.Text = "Guardados (" .. #data.saved .. ")"
	tabFavs.Text = "Favoritos (" .. #data.favs .. ")"
	if #list == 0 then
		new(GS(52), {
			Parent = _lf, Size = UDim2.fromOffset(ROW_W, 100), BackgroundTransparency = 1,
			Text = _at == "saved" and GS(313) or GS(314),
			Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = IC.soft,
		})
		return
	end
	for i, e in ipairs(list) do buildRow(e, _at, i) end
end

local function setTab(name)
	_at = name
	local info = TweenInfo.new(0.15)
	tween(tabSaved, info, {
		BackgroundTransparency = name == "saved" and 0.25 or 1,
		TextColor3 = name == "saved" and WHITE or IC.soft,
	})
	tween(tabFavs, info, {
		BackgroundTransparency = name == "favs" and 0.25 or 1,
		TextColor3 = name == "favs" and WHITE or IC.soft,
	})
	tween(tabStrokes.saved, info, { Transparency = name == "saved" and 0.4 or 1 })
	tween(tabStrokes.favs, info, { Transparency = name == "favs" and 0.4 or 1 })
	_lf.CanvasPosition = Vector2.new(0, 0)
	refreshList()
end

btnSearch.btn.MouseButton1Click:Connect(function() task.spawn(search, input.Text) end)
input.FocusLost:Connect(function(enter)
	if enter then task.spawn(search, input.Text) end
end)
btnCopy.btn.MouseButton1Click:Connect(function() task.spawn(copyCurrent) end)
btnSave.btn.MouseButton1Click:Connect(function() addTo("saved") end)
btnFav.btn.MouseButton1Click:Connect(function() addTo("favs") end)
tabSaved.MouseButton1Click:Connect(function() setTab("saved") end)
tabFavs.MouseButton1Click:Connect(function() setTab("favs") end)

btnRestore.btn.MouseButton1Click:Connect(function()
	if _apl then return end
	_apl = true
	setStatus(GS(321), IC.soft)
	task.spawn(function()
		local ok, err = pcall(restoreAvatar)
		if ok then
			setStatus(GS(322), T.green)
		else
			setStatus(GS(320) .. tostring(err), T.red)
		end
		setProgress(0)
		_apl = false
	end)
end)

setTab("saved")

local FS = 52
local floatRoot = new(GS(53), {
	Parent = gui, Size = UDim2.fromOffset(FS, FS), Position = UDim2.fromOffset(20, 100),
	BackgroundTransparency = 1, Visible = false, Active = true,
})
local floatBtn = new(GS(51), {
	Parent = floatRoot, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, AutoButtonColor = false,
	Text = "", BorderSizePixel = 0, ClipsDescendants = true,
})
corner(floatBtn, 12)
local floatStroke = stroke(floatBtn, WHITE, 2, 0.2)
local floatGrad = grad(floatStroke, IC.gold, IC.btnLine, 45)
tween(floatGrad, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), { Rotation = 405 })
local floatImg = new(GS(54), {
	Parent = floatBtn, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
	ScaleType = Enum.ScaleType.Crop, Image = "", BorderSizePixel = 0, Active = false,
	ImageTransparency = 1,
})
corner(floatImg, 12)
_UI.logo(floatImg)
local floatScale = new(GS(60), { Parent = floatBtn, Scale = 0 })

local token = 0
local floatPlaced = false
local TI_CLOSE = TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
local TI_FLOAT_OUT = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

local function floatDelta()
	local fx = floatRoot.Position.X.Offset + FS / 2
	local fy = floatRoot.Position.Y.Offset + FS / 2
	local rx = _Rt.Position.X.Offset + (W * BASE) / 2
	local ry = _Rt.Position.Y.Offset + (H * BASE) / 2
	return fx - rx, fy - ry
end

local function openWindow()
	token = token + 1
	local my = token
	local fromFloat = floatPlaced and floatRoot.Visible

	_Rt.Visible = true
	_Wn.GroupTransparency = 1
	if fromFloat then
		local dx, dy = floatDelta()
		_Wn.Position = UDim2.new(0.5, dx, 0.5, dy)
		winScale.Scale = BASE * 0.2
	else
		_Wn.Position = UDim2.new(0.5, 0, 0.5, 26)
		winScale.Scale = BASE * 0.8
	end
	bgScale.Scale = 1.14
	_Lf.Position = UDim2.fromOffset(-30, 52)
	_Rg.Position = UDim2.fromOffset(260, 52)
	headLine.Size = UDim2.new(0, 0, 0, 1)

	tween(_Wn, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 })
	tween(winScale, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = BASE })
	tween(_Wn, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Position = UDim2.fromScale(0.5, 0.5),
	})
	tween(headLine, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0.1), {
		Size = UDim2.new(1, 0, 0, 1),
	})
	tween(_Lf, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0.08), {
		Position = UDim2.fromOffset(10, 52),
	})
	tween(_Rg, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0.16), {
		Position = UDim2.fromOffset(210, 52),
	})
	tween(bgScale, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })

	tween(floatScale, TI_FLOAT_OUT, { Scale = 0 }).Completed:Connect(function()
		if token == my then floatRoot.Visible = false end
	end)
end

local function minimizeWindow()
	token = token + 1
	local my = token
	if not floatPlaced then
		local vp = _UI.viewport()
		local cx = _Rt.Position.X.Offset + (W * BASE) / 2 - FS / 2
		local cy = _Rt.Position.Y.Offset + (H * BASE) / 2 - FS / 2
		floatRoot.Position = UDim2.fromOffset(
			math.clamp(cx, 0, math.max(0, vp.X - FS)),
			math.clamp(cy, 0, math.max(0, vp.Y - FS))
		)
		floatPlaced = true
	end
	floatRoot.Visible = true
	floatScale.Scale = 0
	local dx, dy = floatDelta()

	tween(_Wn, TI_CLOSE, { GroupTransparency = 1, Position = UDim2.new(0.5, dx, 0.5, dy) })
	tween(winScale, TI_CLOSE, { Scale = BASE * 0.2 }).Completed:Connect(function()
		if token == my then
			_Rt.Visible = false
			_Wn.Position = UDim2.fromScale(0.5, 0.5)
		end
	end)
	tween(floatScale, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.12), { Scale = 1 })
end

_UI.draggable(floatBtn, floatRoot, openWindow,
	function()
		tween(floatScale, TweenInfo.new(0.1), { Scale = 0.92 })
	end,
	function()
		tween(floatScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
	end)

btnMin.MouseButton1Click:Connect(minimizeWindow)

local function destroyAll()
	pcall(restoreAvatar)
	for _, b in pairs(_Bd) do
		if b.template then pcall(function() b.template:Destroy() end) end
	end
	_Bd, _Bo = {}, {}
	for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
	conns = {}
	if gui then gui:Destroy() end
	env.ChileAvatarCleanup = nil
end
env.ChileAvatarCleanup = destroyAll

btnClose.MouseButton1Click:Connect(function()
	_Md.show({
		title = GS(293),
		text = GS(294),
		leftText = GS(295), leftStyle = "main",
		rightText = GS(296), rightStyle = "danger",
		onRight = function()
			tween(winScale, TI_CLOSE, { Scale = BASE * 0.85 })
			tween(_Wn, TI_CLOSE, { GroupTransparency = 1 }).Completed:Connect(destroyAll)
		end,
	})
end)

_Rt.Visible = false

local introGui = new(GS(55), {
	Name = GS(331), ResetOnSpawn = false, IgnoreGuiInset = true,
	DisplayOrder = 1000, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, Parent = parent,
})

local intro = new(GS(56), {
	Parent = introGui, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK,
	BackgroundTransparency = 0, BorderSizePixel = 0, GroupTransparency = 1, Active = true,
})

local introBgScale = _UI.background(intro, 0.55)

local CW, CH = 735, 340
local content = new(GS(53), {
	Parent = intro, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.46),
	Size = UDim2.fromOffset(CW, CH), BackgroundTransparency = 1, BorderSizePixel = 0,
})
local contentScale = new(GS(60), { Parent = content, Scale = 1 })

local function introVP()
	local s = introGui.AbsoluteSize
	if s.X < 10 or s.Y < 10 then s = workspace.CurrentCamera.ViewportSize end
	return s
end
local function fitIntro()
	local v = introVP()
	contentScale.Scale = math.clamp(math.min(v.X / CW, v.Y / 380), 0.3, 1.3)
end
fitIntro()
track(introGui:GetPropertyChangedSignal(GS(163)):Connect(fitIntro))

local titleLbl = new(GS(52), {
	Parent = content, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromOffset(CW, 60),
	BackgroundTransparency = 1, Text = GS(273), Font = Enum.Font.Garamond,
	TextSize = 50, TextColor3 = WHITE, TextStrokeTransparency = 0.88, TextStrokeColor3 = BLACK,
})
grad(titleLbl, IC.title, IC.titleLow, 90)

new(GS(53), {
	Parent = content, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(0.5, -28, 0, 82),
	Size = UDim2.fromOffset(150, 1), BackgroundColor3 = IC.soft, BackgroundTransparency = 0.55, BorderSizePixel = 0,
})
new(GS(53), {
	Parent = content, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0.5, 28, 0, 82),
	Size = UDim2.fromOffset(150, 1), BackgroundColor3 = IC.soft, BackgroundTransparency = 0.55, BorderSizePixel = 0,
})
new(GS(52), {
	Parent = content, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0, 82),
	Size = UDim2.fromOffset(50, 24), BackgroundTransparency = 1, Text = "By", Font = Enum.Font.Garamond,
	TextSize = 22, TextColor3 = IC.soft,
})

new(GS(52), {
	Parent = content, Position = UDim2.fromOffset(0, 100), Size = UDim2.fromOffset(CW, 34),
	BackgroundTransparency = 1, Text = GS(290), Font = Enum.Font.Garamond,
	TextSize = 26, TextColor3 = IC.soft, TextStrokeTransparency = 0.9, TextStrokeColor3 = BLACK,
})

local introBusy = false

local function introButton(text, y, style, onClick)
	local h = makeButton({
		parent = content, text = text, size = UDim2.fromOffset(270, 42),
		pos = UDim2.fromOffset(CW / 2, y + 21), anchor = Vector2.new(0.5, 0.5),
		style = style, textSize = 14, radius = 3, diamonds = style == "main",
	})
	h.btn.MouseButton1Click:Connect(function()
		if introBusy then return end
		onClick(h.label)
	end)
	return h
end

local function closeIntro(after)
	if introBusy then return end
	introBusy = true
	tween(intro, TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { GroupTransparency = 1 })
	task.delay(0.6, function()
		pcall(function() introGui:Destroy() end)
		introGui = nil
		if after then after() end
	end)
end

local function copyText(s)
	local fn = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if not fn then return false end
	return (pcall(fn, s))
end

introButton(GS(287), 160, "main", function()
	closeIntro(openWindow)
end)

introButton(GS(288), 208, "dark", function(lbl)
	local ok = copyText(_dl)
	lbl.Text = ok and GS(291) or GS(292)
	lbl.TextColor3 = T.green
	task.delay(1.8, function()
		if lbl.Parent then
			lbl.Text = GS(288)
			lbl.TextColor3 = STYLES.dark.text
		end
	end)
end)

introButton(GS(289), 256, "dark", function()
	closeIntro(function()
		local c = env.ChileAvatarCleanup
		if c then pcall(c) end
	end)
end)

local footer = new(GS(53), {
	Parent = intro, AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, -16),
	Size = UDim2.fromOffset(320, 22), BackgroundTransparency = 1,
})
new(GS(53), {
	Parent = footer, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(0.5, -86, 0.5, 0),
	Size = UDim2.fromOffset(60, 1), BackgroundColor3 = IC.soft, BackgroundTransparency = 0.55, BorderSizePixel = 0,
})
new(GS(53), {
	Parent = footer, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0.5, 86, 0.5, 0),
	Size = UDim2.fromOffset(60, 1), BackgroundColor3 = IC.soft, BackgroundTransparency = 0.55, BorderSizePixel = 0,
})
new(GS(52), {
	Parent = footer, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(160, 22), BackgroundTransparency = 1, Text = "Founder By Mac",
	Font = Enum.Font.Garamond, TextSize = 18, TextColor3 = IC.soft,
})

local baseCleanup = env.ChileAvatarCleanup
env.ChileAvatarCleanup = function()
	pcall(function() if introGui then introGui:Destroy() end end)
	if baseCleanup then baseCleanup() end
end

task.spawn(function()
	do local _j=_junk() task.wait(0.2) end
	if not introGui or not introGui.Parent then return end
	local basePos = content.Position
	content.Position = basePos + UDim2.fromOffset(0, 16)
	tween(intro, TweenInfo.new(1.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 })
	tween(content, TweenInfo.new(1.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = basePos })
	tween(introBgScale, TweenInfo.new(9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
end)