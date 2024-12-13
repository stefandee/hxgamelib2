package gamelib2.data;

class CountryCodes
{
	public static var codeFlag : Hash<Int>;

	public static var INIT_CODEFLAG =
	{
		codeFlag = new Hash();

		codeFlag.set("ad", 0); //Andorra
		codeFlag.set("ae", 1); //United Arab Emirates
		codeFlag.set("af", 2); //Afghanistan
		codeFlag.set("ag", 3); //Antigua and Barbuda
		codeFlag.set("ai", 4); //Anguilla
		codeFlag.set("al", 5); //Albania
		codeFlag.set("am", 6); //Armenia
		codeFlag.set("an", 7); //Netherlands Antilles
		codeFlag.set("ao", 8); //Angola
		codeFlag.set("aq", 9); //Antarctica
		codeFlag.set("ar", 10); //Argentina
		codeFlag.set("as", 11); //American Samoa
		codeFlag.set("at", 12); //Austria
		codeFlag.set("au", 13); //Australia
		codeFlag.set("aw", 14); //Aruba
		codeFlag.set("az", 15); //Azerbaijan
		codeFlag.set("ba", 16); //Bosnia and Herzegovina
		codeFlag.set("bb", 17); //Barbados
		codeFlag.set("bd", 18); //Bangladesh
		codeFlag.set("be", 19); //Belgium
		codeFlag.set("bf", 20); //Burkina Faso
		codeFlag.set("bg", 21); //Bulgaria
		codeFlag.set("bh", 22); //Bahrain
		codeFlag.set("bi", 23); //Burundi
		codeFlag.set("bj", 24); //Benin
		codeFlag.set("bm", 25); //Bermuda
		codeFlag.set("bn", 26); //Brunei Darussalam
		codeFlag.set("bo", 27); //Bolivia
		codeFlag.set("br", 28); //Brazil
		codeFlag.set("bs", 29); //Bahamas
		codeFlag.set("bt", 30); //Bhutan
		codeFlag.set("bv", 31); //Bouvet Island
		codeFlag.set("bw", 32); //Botswana
		codeFlag.set("by", 33); //Belarus
		codeFlag.set("bz", 34); //Belize
		codeFlag.set("ca", 35); //Canada
		codeFlag.set("cc", 36); //Cocos (Keeling) Islands
		codeFlag.set("cf", 37); //Central African Republic
		codeFlag.set("cg", 38); //Congo
		codeFlag.set("ch", 39); //Switzerland
		codeFlag.set("ck", 40); //Cook Islands
		codeFlag.set("cl", 41); //Chile
		codeFlag.set("cm", 42); //Cameroon
		codeFlag.set("cn", 43); //China
		codeFlag.set("co", 44); //Colombia
		codeFlag.set("cr", 45); //Costa Rica
		codeFlag.set("cs", 46); //Serbia and Montenegro
		codeFlag.set("cu", 47); //Cuba
		codeFlag.set("cv", 48); //Cape Verde
		codeFlag.set("cx", 49); //Christmas Island
		codeFlag.set("cy", 50); //Cyprus
		codeFlag.set("cz", 51); //Czech Republic
		codeFlag.set("de", 52); //Germany
		codeFlag.set("dj", 53); //Djibouti
		codeFlag.set("dk", 54); //Denmark
		codeFlag.set("dm", 55); //Dominica
		codeFlag.set("do", 56); //Dominican Republic
		codeFlag.set("dz", 57); //Algeria
		codeFlag.set("ec", 58); //Ecuador
		codeFlag.set("ee", 59); //Estonia
		codeFlag.set("eg", 60); //Egypt
		codeFlag.set("eh", 61); //Western Sahara
		codeFlag.set("er", 62); //Eritrea
		codeFlag.set("es", 63); //Spain
		codeFlag.set("et", 64); //Ethiopia
		codeFlag.set("fi", 65); //Finland
		codeFlag.set("fj", 66); //Fiji
		codeFlag.set("fk", 67); //Falkland Islands (Malvinas)
		codeFlag.set("fm", 68); //Micronesia
		codeFlag.set("fo", 69); //Faroe Islands
		codeFlag.set("fr", 70); //France
		codeFlag.set("ci", 71); //Ivory Coast
		codeFlag.set("ga", 72); //Gabon
		codeFlag.set("gd", 73); //Grenada
		codeFlag.set("ge", 74); //Georgia
		codeFlag.set("gf", 75); //French Guiana
		codeFlag.set("gh", 76); //Ghana
		codeFlag.set("gi", 77); //Gibraltar
		codeFlag.set("gl", 78); //Greenland
		codeFlag.set("gm", 79); //Gambia
		codeFlag.set("gn", 80); //Guinea
		codeFlag.set("gp", 81); //Guadeloupe
		codeFlag.set("gq", 82); //Equatorial Guinea
		codeFlag.set("gr", 83); //Greece
		codeFlag.set("gs", 84); //S. Georgia and S. Sandwich Isls.
		codeFlag.set("gt", 85); //Guatemala
		codeFlag.set("gu", 86); //Guam
		codeFlag.set("gw", 87); //Guinea-Bissau
		codeFlag.set("gy", 88); //Guyana
		codeFlag.set("hk", 89); //Hong Kong
		codeFlag.set("hm", 90); //Heard and McDonald Islands
		codeFlag.set("hn", 91); //Honduras
		codeFlag.set("hr", 92); //Croatia (Hrvatska)
		codeFlag.set("ht", 93); //Haiti
		codeFlag.set("hu", 94); //Hungary
		codeFlag.set("id", 95); //Indonesia
		codeFlag.set("ie", 96); //Ireland
		codeFlag.set("il", 97); //Israel
		codeFlag.set("in", 98); //India
		codeFlag.set("io", 99); //British Indian Ocean Territory
		codeFlag.set("iq", 100); //Iraq
		codeFlag.set("ir", 101); //Iran
		codeFlag.set("is", 102); //Iceland
		codeFlag.set("it", 103); //Italy
		codeFlag.set("jm", 104); //Jamaica
		codeFlag.set("jo", 105); //Jordan
		codeFlag.set("jp", 106); //Japan
		codeFlag.set("ke", 107); //Kenya
		codeFlag.set("kg", 108); //Kyrgyzstan
		codeFlag.set("kh", 109); //Cambodia
		codeFlag.set("ki", 110); //Kiribati
		codeFlag.set("km", 111); //Comoros
		codeFlag.set("kn", 112); //Saint Kitts and Nevis
		codeFlag.set("kp", 113); //Korea (North)
		codeFlag.set("kr", 114); //Korea (South)
		codeFlag.set("kw", 115); //Kuwait
		codeFlag.set("ky", 116); //Cayman Islands
		codeFlag.set("kz", 117); //Kazakhstan
		codeFlag.set("la", 118); //Laos
		codeFlag.set("lb", 119); //Lebanon
		codeFlag.set("lc", 120); //Saint Lucia
		codeFlag.set("li", 121); //Liechtenstein
		codeFlag.set("lk", 122); //Sri Lanka
		codeFlag.set("lr", 123); //Liberia
		codeFlag.set("ls", 124); //Lesotho
		codeFlag.set("lt", 125); //Lithuania
		codeFlag.set("lu", 126); //Luxembourg
		codeFlag.set("lv", 127); //Latvia
		codeFlag.set("ly", 128); //Libya
		codeFlag.set("ma", 129); //Morocco
		codeFlag.set("mc", 130); //Monaco
		codeFlag.set("md", 131); //Moldova
		codeFlag.set("mg", 132); //Madagascar
		codeFlag.set("mh", 133); //Marshall Islands
		codeFlag.set("mk", 134); //Macedonia
		codeFlag.set("ml", 135); //Mali
		codeFlag.set("mm", 136); //Burma (Myanmar)
		codeFlag.set("mn", 137); //Mongolia
		codeFlag.set("mo", 138); //Macau
		codeFlag.set("mp", 139); //Northern Mariana Islands
		codeFlag.set("mq", 140); //Martinique
		codeFlag.set("mr", 141); //Mauritania
		codeFlag.set("ms", 142); //Montserrat
		codeFlag.set("mt", 143); //Malta
		codeFlag.set("mu", 144); //Mauritius
		codeFlag.set("mv", 145); //Maldives
		codeFlag.set("mw", 146); //Malawi
		codeFlag.set("mx", 147); //Mexico
		codeFlag.set("my", 148); //Malaysia
		codeFlag.set("mz", 149); //Mozambique
		codeFlag.set("na", 150); //Namibia
		codeFlag.set("nc", 151); //New Caledonia
		codeFlag.set("ne", 152); //Niger
		codeFlag.set("nf", 153); //Norfolk Island
		codeFlag.set("ng", 154); //Nigeria
		codeFlag.set("ni", 155); //Nicaragua
		codeFlag.set("nl", 156); //Netherlands
		codeFlag.set("no", 157); //Norway
		codeFlag.set("np", 158); //Nepal
		codeFlag.set("nr", 159); //Nauru
		codeFlag.set("nt", 160); //Neutral Zone
		codeFlag.set("nu", 161); //Niue
		codeFlag.set("nz", 162); //New Zealand (Aotearoa)
		codeFlag.set("om", 163); //Oman
		codeFlag.set("pa", 164); //Panama
		codeFlag.set("pe", 165); //Peru
		codeFlag.set("pf", 166); //French Polynesia
		codeFlag.set("pg", 167); //Papua New Guinea
		codeFlag.set("ph", 168); //Philippines
		codeFlag.set("pk", 169); //Pakistan
		codeFlag.set("pl", 170); //Poland
		codeFlag.set("pm", 171); //St. Pierre and Miquelon
		codeFlag.set("pn", 172); //Pitcairn
		codeFlag.set("pr", 173); //Puerto Rico
		codeFlag.set("pt", 174); //Portugal
		codeFlag.set("pw", 175); //Palau
		codeFlag.set("py", 176); //Paraguay
		codeFlag.set("qa", 177); //Qatar
		codeFlag.set("re", 178); //Reunion
		codeFlag.set("ro", 179); //Romania
		codeFlag.set("ru", 180); //Russia
		codeFlag.set("rw", 181); //Rwanda
		codeFlag.set("sa", 182); //Saudi Arabia
		codeFlag.set("sb", 183); //Solomon Islands
		codeFlag.set("sc", 184); //Seychelles
		codeFlag.set("sd", 185); //Sudan
		codeFlag.set("se", 186); //Sweden
		codeFlag.set("sg", 187); //Singapore
		codeFlag.set("sh", 188); //St. Helena
		codeFlag.set("si", 189); //Slovenia
		codeFlag.set("sj", 190); //Svalbard and Jan Mayen Islands
		codeFlag.set("sk", 191); //Slovak Republic
		codeFlag.set("sl", 192); //Sierra Leone
		codeFlag.set("sm", 193); //San Marino
		codeFlag.set("sn", 194); //Senegal
		codeFlag.set("so", 195); //Somalia
		codeFlag.set("sr", 196); //Suriname
		codeFlag.set("st", 197); //Sao Tome and Principe
		codeFlag.set("sv", 198); //El Salvador
		codeFlag.set("sy", 199); //Syria
		codeFlag.set("sz", 200); //Swaziland
		codeFlag.set("tc", 201); //Turks and Caicos Islands
		codeFlag.set("td", 202); //Chad
		codeFlag.set("tf", 203); //French Southern Territories
		codeFlag.set("tg", 204); //Togo
		codeFlag.set("th", 205); //Thailand
		codeFlag.set("tj", 206); //Tajikistan
		codeFlag.set("tk", 207); //Tokelau
		codeFlag.set("tm", 208); //Turkmenistan
		codeFlag.set("tn", 209); //Tunisia
		codeFlag.set("to", 210); //Tonga
		codeFlag.set("tl", 211); //East Timor
		codeFlag.set("tr", 212); //Turkey
		codeFlag.set("tt", 213); //Trinidad and Tobago
		codeFlag.set("tv", 214); //Tuvalu
		codeFlag.set("tw", 215); //Taiwan
		codeFlag.set("tz", 216); //Tanzania
		codeFlag.set("ua", 217); //Ukraine
		codeFlag.set("ug", 218); //Uganda
		codeFlag.set("uk", 219); //United Kingdom
		codeFlag.set("us", 220); //United States
		codeFlag.set("uy", 221); //Uruguay
		codeFlag.set("uz", 222); //Uzbekistan
		codeFlag.set("va", 223); //Vatican City State (Holy See)
		codeFlag.set("vc", 224); //Saint Vincent and the Grenadines
		codeFlag.set("ve", 225); //Venezuela
		codeFlag.set("vg", 226); //Virgin Islands (British)
		codeFlag.set("vi", 227); //Virgin Islands (U.S.)
		codeFlag.set("vn", 228); //Viet Nam
		codeFlag.set("vu", 229); //Vanuatu
		codeFlag.set("wf", 230); //Wallis and Futuna Islands
		codeFlag.set("ws", 231); //Samoa
		codeFlag.set("ye", 232); //Yemen
		codeFlag.set("yt", 233); //Mayotte
		codeFlag.set("yu", 234); //Yugoslavia
		codeFlag.set("za", 235); //South Africa
		codeFlag.set("zm", 236); //Zambia
		codeFlag.set("cd", 237); //Democratic Republic of Congo
		codeFlag.set("zw", 238); //Zimbabwe
		codeFlag.set("ap", 239); //Asia-Pacific
		codeFlag.set("rs", 240); //Republic of Serbia
		codeFlag.set("ax", 241); //Aland Islands
		codeFlag.set("eu", 242); //Europe
		codeFlag.set("01", 243); //Private
		codeFlag.set("ps", 244); //Palestinian Territory, Occupied
		codeFlag.set("me", 245); //Montenegro
	}
}
