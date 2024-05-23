#!/usr/bin/awk -f

# Usage: echo $(date -u +"%Y-%m-%d") | ./.mekadimo_date.awk

BEGIN {
	month_names[1] = "Printuno"
	month_names[2] = "Sometro"
	month_names[3] = "Awtempo"
	month_names[4] = "Vinro"

	leap_day_map["1 1"]   = "4 13"
	leap_day_map["1 2"]   = "4 14"
	leap_day_map["1 3"]   = "4 15"
	leap_day_map["1 4"]   = "4 16"
	leap_day_map["1 5"]   = "4 17"
	leap_day_map["1 6"]   = "4 18"
	leap_day_map["1 7"]   = "4 19"
	leap_day_map["1 8"]   = "4 20"
	leap_day_map["1 9"]   = "4 21"
	leap_day_map["1 10"]  = "4 22"
	leap_day_map["1 11"]  = "4 23"
	leap_day_map["1 12"]  = "4 24"
	leap_day_map["1 13"]  = "4 25"
	leap_day_map["1 14"]  = "4 26"
	leap_day_map["1 15"]  = "4 27"
	leap_day_map["1 16"]  = "4 28"
	leap_day_map["1 17"]  = "4 29"
	leap_day_map["1 18"]  = "4 30"
	leap_day_map["1 19"]  = "4 31"
	leap_day_map["1 20"]  = "4 32"
	leap_day_map["1 21"]  = "4 33"
	leap_day_map["1 22"]  = "4 34"
	leap_day_map["1 23"]  = "4 35"
	leap_day_map["1 24"]  = "4 36"
	leap_day_map["1 25"]  = "4 37"
	leap_day_map["1 26"]  = "4 38"
	leap_day_map["1 27"]  = "4 39"
	leap_day_map["1 28"]  = "4 40"
	leap_day_map["1 29"]  = "4 41"
	leap_day_map["1 30"]  = "4 42"
	leap_day_map["1 31"]  = "4 43"
	leap_day_map["2 1"]   = "4 44"
	leap_day_map["2 2"]   = "4 45"
	leap_day_map["2 3"]   = "4 46"
	leap_day_map["2 4"]   = "4 47"
	leap_day_map["2 5"]   = "4 48"
	leap_day_map["2 6"]   = "4 49"
	leap_day_map["2 7"]   = "4 50"
	leap_day_map["2 8"]   = "4 51"
	leap_day_map["2 9"]   = "4 52"
	leap_day_map["2 10"]  = "4 53"
	leap_day_map["2 11"]  = "4 54"
	leap_day_map["2 12"]  = "4 55"
	leap_day_map["2 13"]  = "4 56"
	leap_day_map["2 14"]  = "4 57"
	leap_day_map["2 15"]  = "4 58"
	leap_day_map["2 16"]  = "4 59"
	leap_day_map["2 17"]  = "4 60"
	leap_day_map["2 18"]  = "4 61"
	leap_day_map["2 19"]  = "4 62"
	leap_day_map["2 20"]  = "4 63"
	leap_day_map["2 21"]  = "4 64"
	leap_day_map["2 22"]  = "4 65"
	leap_day_map["2 23"]  = "4 66"
	leap_day_map["2 24"]  = "4 67"
	leap_day_map["2 25"]  = "4 68"
	leap_day_map["2 26"]  = "4 69"
	leap_day_map["2 27"]  = "4 70"
	leap_day_map["2 28"]  = "4 71"
	leap_day_map["2 29"]  = "4 72"
	leap_day_map["3 1"]   = "4 73"
	leap_day_map["3 2"]   = "4 74"
	leap_day_map["3 3"]   = "4 75"
	leap_day_map["3 4"]   = "4 76"
	leap_day_map["3 5"]   = "4 77"
	leap_day_map["3 6"]   = "4 78"
	leap_day_map["3 7"]   = "4 79"
	leap_day_map["3 8"]   = "4 80"
	leap_day_map["3 9"]   = "4 81"
	leap_day_map["3 10"]  = "4 82"
	leap_day_map["3 11"]  = "4 83"
	leap_day_map["3 12"]  = "4 84"
	leap_day_map["3 13"]  = "4 85"
	leap_day_map["3 14"]  = "4 86"
	leap_day_map["3 15"]  = "4 87"
	leap_day_map["3 16"]  = "4 88"
	leap_day_map["3 17"]  = "4 89"
	leap_day_map["3 18"]  = "4 90"
	leap_day_map["3 19"]  = "4 91"
	leap_day_map["3 20"]  = "1 0"
	leap_day_map["3 21"]  = "1 1"
	leap_day_map["3 22"]  = "1 2"
	leap_day_map["3 23"]  = "1 3"
	leap_day_map["3 24"]  = "1 4"
	leap_day_map["3 25"]  = "1 5"
	leap_day_map["3 26"]  = "1 6"
	leap_day_map["3 27"]  = "1 7"
	leap_day_map["3 28"]  = "1 8"
	leap_day_map["3 29"]  = "1 9"
	leap_day_map["3 30"]  = "1 10"
	leap_day_map["3 31"]  = "1 11"
	leap_day_map["4 1"]   = "1 12"
	leap_day_map["4 2"]   = "1 13"
	leap_day_map["4 3"]   = "1 14"
	leap_day_map["4 4"]   = "1 15"
	leap_day_map["4 5"]   = "1 16"
	leap_day_map["4 6"]   = "1 17"
	leap_day_map["4 7"]   = "1 18"
	leap_day_map["4 8"]   = "1 19"
	leap_day_map["4 9"]   = "1 20"
	leap_day_map["4 10"]  = "1 21"
	leap_day_map["4 11"]  = "1 22"
	leap_day_map["4 12"]  = "1 23"
	leap_day_map["4 13"]  = "1 24"
	leap_day_map["4 14"]  = "1 25"
	leap_day_map["4 15"]  = "1 26"
	leap_day_map["4 16"]  = "1 27"
	leap_day_map["4 17"]  = "1 28"
	leap_day_map["4 18"]  = "1 29"
	leap_day_map["4 19"]  = "1 30"
	leap_day_map["4 20"]  = "1 31"
	leap_day_map["4 21"]  = "1 32"
	leap_day_map["4 22"]  = "1 33"
	leap_day_map["4 23"]  = "1 34"
	leap_day_map["4 24"]  = "1 35"
	leap_day_map["4 25"]  = "1 36"
	leap_day_map["4 26"]  = "1 37"
	leap_day_map["4 27"]  = "1 38"
	leap_day_map["4 28"]  = "1 39"
	leap_day_map["4 29"]  = "1 40"
	leap_day_map["4 30"]  = "1 41"
	leap_day_map["5 1"]   = "1 42"
	leap_day_map["5 2"]   = "1 43"
	leap_day_map["5 3"]   = "1 44"
	leap_day_map["5 4"]   = "1 45"
	leap_day_map["5 5"]   = "1 46"
	leap_day_map["5 6"]   = "1 47"
	leap_day_map["5 7"]   = "1 48"
	leap_day_map["5 8"]   = "1 49"
	leap_day_map["5 9"]   = "1 50"
	leap_day_map["5 10"]  = "1 51"
	leap_day_map["5 11"]  = "1 52"
	leap_day_map["5 12"]  = "1 53"
	leap_day_map["5 13"]  = "1 54"
	leap_day_map["5 14"]  = "1 55"
	leap_day_map["5 15"]  = "1 56"
	leap_day_map["5 16"]  = "1 57"
	leap_day_map["5 17"]  = "1 58"
	leap_day_map["5 18"]  = "1 59"
	leap_day_map["5 19"]  = "1 60"
	leap_day_map["5 20"]  = "1 61"
	leap_day_map["5 21"]  = "1 62"
	leap_day_map["5 22"]  = "1 63"
	leap_day_map["5 23"]  = "1 64"
	leap_day_map["5 24"]  = "1 65"
	leap_day_map["5 25"]  = "1 66"
	leap_day_map["5 26"]  = "1 67"
	leap_day_map["5 27"]  = "1 68"
	leap_day_map["5 28"]  = "1 69"
	leap_day_map["5 29"]  = "1 70"
	leap_day_map["5 30"]  = "1 71"
	leap_day_map["5 31"]  = "1 72"
	leap_day_map["6 1"]   = "1 73"
	leap_day_map["6 2"]   = "1 74"
	leap_day_map["6 3"]   = "1 75"
	leap_day_map["6 4"]   = "1 76"
	leap_day_map["6 5"]   = "1 77"
	leap_day_map["6 6"]   = "1 78"
	leap_day_map["6 7"]   = "1 79"
	leap_day_map["6 8"]   = "1 80"
	leap_day_map["6 9"]   = "1 81"
	leap_day_map["6 10"]  = "1 82"
	leap_day_map["6 11"]  = "1 83"
	leap_day_map["6 12"]  = "1 84"
	leap_day_map["6 13"]  = "1 85"
	leap_day_map["6 14"]  = "1 86"
	leap_day_map["6 15"]  = "1 87"
	leap_day_map["6 16"]  = "1 88"
	leap_day_map["6 17"]  = "1 89"
	leap_day_map["6 18"]  = "1 90"
	leap_day_map["6 19"]  = "2 0"
	leap_day_map["6 20"]  = "2 1"
	leap_day_map["6 21"]  = "2 2"
	leap_day_map["6 22"]  = "2 3"
	leap_day_map["6 23"]  = "2 4"
	leap_day_map["6 24"]  = "2 5"
	leap_day_map["6 25"]  = "2 6"
	leap_day_map["6 26"]  = "2 7"
	leap_day_map["6 27"]  = "2 8"
	leap_day_map["6 28"]  = "2 9"
	leap_day_map["6 29"]  = "2 10"
	leap_day_map["6 30"]  = "2 11"
	leap_day_map["7 1"]   = "2 12"
	leap_day_map["7 2"]   = "2 13"
	leap_day_map["7 3"]   = "2 14"
	leap_day_map["7 4"]   = "2 15"
	leap_day_map["7 5"]   = "2 16"
	leap_day_map["7 6"]   = "2 17"
	leap_day_map["7 7"]   = "2 18"
	leap_day_map["7 8"]   = "2 19"
	leap_day_map["7 9"]   = "2 20"
	leap_day_map["7 10"]  = "2 21"
	leap_day_map["7 11"]  = "2 22"
	leap_day_map["7 12"]  = "2 23"
	leap_day_map["7 13"]  = "2 24"
	leap_day_map["7 14"]  = "2 25"
	leap_day_map["7 15"]  = "2 26"
	leap_day_map["7 16"]  = "2 27"
	leap_day_map["7 17"]  = "2 28"
	leap_day_map["7 18"]  = "2 29"
	leap_day_map["7 19"]  = "2 30"
	leap_day_map["7 20"]  = "2 31"
	leap_day_map["7 21"]  = "2 32"
	leap_day_map["7 22"]  = "2 33"
	leap_day_map["7 23"]  = "2 34"
	leap_day_map["7 24"]  = "2 35"
	leap_day_map["7 25"]  = "2 36"
	leap_day_map["7 26"]  = "2 37"
	leap_day_map["7 27"]  = "2 38"
	leap_day_map["7 28"]  = "2 39"
	leap_day_map["7 29"]  = "2 40"
	leap_day_map["7 30"]  = "2 41"
	leap_day_map["7 31"]  = "2 42"
	leap_day_map["8 1"]   = "2 43"
	leap_day_map["8 2"]   = "2 44"
	leap_day_map["8 3"]   = "2 45"
	leap_day_map["8 4"]   = "2 46"
	leap_day_map["8 5"]   = "2 47"
	leap_day_map["8 6"]   = "2 48"
	leap_day_map["8 7"]   = "2 49"
	leap_day_map["8 8"]   = "2 50"
	leap_day_map["8 9"]   = "2 51"
	leap_day_map["8 10"]  = "2 52"
	leap_day_map["8 11"]  = "2 53"
	leap_day_map["8 12"]  = "2 54"
	leap_day_map["8 13"]  = "2 55"
	leap_day_map["8 14"]  = "2 56"
	leap_day_map["8 15"]  = "2 57"
	leap_day_map["8 16"]  = "2 58"
	leap_day_map["8 17"]  = "2 59"
	leap_day_map["8 18"]  = "2 60"
	leap_day_map["8 19"]  = "2 61"
	leap_day_map["8 20"]  = "2 62"
	leap_day_map["8 21"]  = "2 63"
	leap_day_map["8 22"]  = "2 64"
	leap_day_map["8 23"]  = "2 65"
	leap_day_map["8 24"]  = "2 66"
	leap_day_map["8 25"]  = "2 67"
	leap_day_map["8 26"]  = "2 68"
	leap_day_map["8 27"]  = "2 69"
	leap_day_map["8 28"]  = "2 70"
	leap_day_map["8 29"]  = "2 71"
	leap_day_map["8 30"]  = "2 72"
	leap_day_map["8 31"]  = "2 73"
	leap_day_map["9 1"]   = "2 74"
	leap_day_map["9 2"]   = "2 75"
	leap_day_map["9 3"]   = "2 76"
	leap_day_map["9 4"]   = "2 77"
	leap_day_map["9 5"]   = "2 78"
	leap_day_map["9 6"]   = "2 79"
	leap_day_map["9 7"]   = "2 80"
	leap_day_map["9 8"]   = "2 81"
	leap_day_map["9 9"]   = "2 82"
	leap_day_map["9 10"]  = "2 83"
	leap_day_map["9 11"]  = "2 84"
	leap_day_map["9 12"]  = "2 85"
	leap_day_map["9 13"]  = "2 86"
	leap_day_map["9 14"]  = "2 87"
	leap_day_map["9 15"]  = "2 88"
	leap_day_map["9 16"]  = "2 89"
	leap_day_map["9 17"]  = "2 90"
	leap_day_map["9 18"]  = "2 91"
	leap_day_map["9 19"]  = "3 0"
	leap_day_map["9 20"]  = "3 1"
	leap_day_map["9 21"]  = "3 2"
	leap_day_map["9 22"]  = "3 3"
	leap_day_map["9 23"]  = "3 4"
	leap_day_map["9 24"]  = "3 5"
	leap_day_map["9 25"]  = "3 6"
	leap_day_map["9 26"]  = "3 7"
	leap_day_map["9 27"]  = "3 8"
	leap_day_map["9 28"]  = "3 9"
	leap_day_map["9 29"]  = "3 10"
	leap_day_map["9 30"]  = "3 11"
	leap_day_map["10 1"]  = "3 12"
	leap_day_map["10 2"]  = "3 13"
	leap_day_map["10 3"]  = "3 14"
	leap_day_map["10 4"]  = "3 15"
	leap_day_map["10 5"]  = "3 16"
	leap_day_map["10 6"]  = "3 17"
	leap_day_map["10 7"]  = "3 18"
	leap_day_map["10 8"]  = "3 19"
	leap_day_map["10 9"]  = "3 20"
	leap_day_map["10 10"] = "3 21"
	leap_day_map["10 11"] = "3 22"
	leap_day_map["10 12"] = "3 23"
	leap_day_map["10 13"] = "3 24"
	leap_day_map["10 14"] = "3 25"
	leap_day_map["10 15"] = "3 26"
	leap_day_map["10 16"] = "3 27"
	leap_day_map["10 17"] = "3 28"
	leap_day_map["10 18"] = "3 29"
	leap_day_map["10 19"] = "3 30"
	leap_day_map["10 20"] = "3 31"
	leap_day_map["10 21"] = "3 32"
	leap_day_map["10 22"] = "3 33"
	leap_day_map["10 23"] = "3 34"
	leap_day_map["10 24"] = "3 35"
	leap_day_map["10 25"] = "3 36"
	leap_day_map["10 26"] = "3 37"
	leap_day_map["10 27"] = "3 38"
	leap_day_map["10 28"] = "3 39"
	leap_day_map["10 29"] = "3 40"
	leap_day_map["10 30"] = "3 41"
	leap_day_map["10 31"] = "3 42"
	leap_day_map["11 1"]  = "3 43"
	leap_day_map["11 2"]  = "3 44"
	leap_day_map["11 3"]  = "3 45"
	leap_day_map["11 4"]  = "3 46"
	leap_day_map["11 5"]  = "3 47"
	leap_day_map["11 6"]  = "3 48"
	leap_day_map["11 7"]  = "3 49"
	leap_day_map["11 8"]  = "3 50"
	leap_day_map["11 9"]  = "3 51"
	leap_day_map["11 10"] = "3 52"
	leap_day_map["11 11"] = "3 53"
	leap_day_map["11 12"] = "3 54"
	leap_day_map["11 13"] = "3 55"
	leap_day_map["11 14"] = "3 56"
	leap_day_map["11 15"] = "3 57"
	leap_day_map["11 16"] = "3 58"
	leap_day_map["11 17"] = "3 59"
	leap_day_map["11 18"] = "3 60"
	leap_day_map["11 19"] = "3 61"
	leap_day_map["11 20"] = "3 62"
	leap_day_map["11 21"] = "3 63"
	leap_day_map["11 22"] = "3 64"
	leap_day_map["11 23"] = "3 65"
	leap_day_map["11 24"] = "3 66"
	leap_day_map["11 25"] = "3 67"
	leap_day_map["11 26"] = "3 68"
	leap_day_map["11 27"] = "3 69"
	leap_day_map["11 28"] = "3 70"
	leap_day_map["11 29"] = "3 71"
	leap_day_map["11 30"] = "3 72"
	leap_day_map["12 1"]  = "3 73"
	leap_day_map["12 2"]  = "3 74"
	leap_day_map["12 3"]  = "3 75"
	leap_day_map["12 4"]  = "3 76"
	leap_day_map["12 5"]  = "3 77"
	leap_day_map["12 6"]  = "3 78"
	leap_day_map["12 7"]  = "3 79"
	leap_day_map["12 8"]  = "3 80"
	leap_day_map["12 9"]  = "3 81"
	leap_day_map["12 10"] = "3 82"
	leap_day_map["12 11"] = "3 83"
	leap_day_map["12 12"] = "3 84"
	leap_day_map["12 13"] = "3 85"
	leap_day_map["12 14"] = "3 86"
	leap_day_map["12 15"] = "3 87"
	leap_day_map["12 16"] = "3 88"
	leap_day_map["12 17"] = "3 89"
	leap_day_map["12 18"] = "3 90"
	leap_day_map["12 19"] = "4 0"
	leap_day_map["12 20"] = "4 1"
	leap_day_map["12 21"] = "4 2"
	leap_day_map["12 22"] = "4 3"
	leap_day_map["12 23"] = "4 4"
	leap_day_map["12 24"] = "4 5"
	leap_day_map["12 25"] = "4 6"
	leap_day_map["12 26"] = "4 7"
	leap_day_map["12 27"] = "4 8"
	leap_day_map["12 28"] = "4 9"
	leap_day_map["12 29"] = "4 10"
	leap_day_map["12 30"] = "4 11"
	leap_day_map["12 31"] = "4 12"

	day_map["1 1"] = "4 13"
	day_map["1 2"] = "4 14"
	day_map["1 3"] = "4 15"
	day_map["1 4"] = "4 16"
	day_map["1 5"] = "4 17"
	day_map["1 6"] = "4 18"
	day_map["1 7"] = "4 19"
	day_map["1 8"] = "4 20"
	day_map["1 9"] = "4 21"
	day_map["1 10"] = "4 22"
	day_map["1 11"] = "4 23"
	day_map["1 12"] = "4 24"
	day_map["1 13"] = "4 25"
	day_map["1 14"] = "4 26"
	day_map["1 15"] = "4 27"
	day_map["1 16"] = "4 28"
	day_map["1 17"] = "4 29"
	day_map["1 18"] = "4 30"
	day_map["1 19"] = "4 31"
	day_map["1 20"] = "4 32"
	day_map["1 21"] = "4 33"
	day_map["1 22"] = "4 34"
	day_map["1 23"] = "4 35"
	day_map["1 24"] = "4 36"
	day_map["1 25"] = "4 37"
	day_map["1 26"] = "4 38"
	day_map["1 27"] = "4 39"
	day_map["1 28"] = "4 40"
	day_map["1 29"] = "4 41"
	day_map["1 30"] = "4 42"
	day_map["1 31"] = "4 43"
	day_map["2 1"] = "4 44"
	day_map["2 2"] = "4 45"
	day_map["2 3"] = "4 46"
	day_map["2 4"] = "4 47"
	day_map["2 5"] = "4 48"
	day_map["2 6"] = "4 49"
	day_map["2 7"] = "4 50"
	day_map["2 8"] = "4 51"
	day_map["2 9"] = "4 52"
	day_map["2 10"] = "4 53"
	day_map["2 11"] = "4 54"
	day_map["2 12"] = "4 55"
	day_map["2 13"] = "4 56"
	day_map["2 14"] = "4 57"
	day_map["2 15"] = "4 58"
	day_map["2 16"] = "4 59"
	day_map["2 17"] = "4 60"
	day_map["2 18"] = "4 61"
	day_map["2 19"] = "4 62"
	day_map["2 20"] = "4 63"
	day_map["2 21"] = "4 64"
	day_map["2 22"] = "4 65"
	day_map["2 23"] = "4 66"
	day_map["2 24"] = "4 67"
	day_map["2 25"] = "4 68"
	day_map["2 26"] = "4 69"
	day_map["2 27"] = "4 70"
	day_map["2 28"] = "4 71"
	day_map["3 1"] = "4 72"
	day_map["3 2"] = "4 73"
	day_map["3 3"] = "4 74"
	day_map["3 4"] = "4 75"
	day_map["3 5"] = "4 76"
	day_map["3 6"] = "4 77"
	day_map["3 7"] = "4 78"
	day_map["3 8"] = "4 79"
	day_map["3 9"] = "4 80"
	day_map["3 10"] = "4 81"
	day_map["3 11"] = "4 82"
	day_map["3 12"] = "4 83"
	day_map["3 13"] = "4 84"
	day_map["3 14"] = "4 85"
	day_map["3 15"] = "4 86"
	day_map["3 16"] = "4 87"
	day_map["3 17"] = "4 88"
	day_map["3 18"] = "4 89"
	day_map["3 19"] = "4 90"
	day_map["3 20"] = "4 91"
	day_map["3 21"] = "1 0"
	day_map["3 22"] = "1 1"
	day_map["3 23"] = "1 2"
	day_map["3 24"] = "1 3"
	day_map["3 25"] = "1 4"
	day_map["3 26"] = "1 5"
	day_map["3 27"] = "1 6"
	day_map["3 28"] = "1 7"
	day_map["3 29"] = "1 8"
	day_map["3 30"] = "1 9"
	day_map["3 31"] = "1 10"
	day_map["4 1"] = "1 11"
	day_map["4 2"] = "1 12"
	day_map["4 3"] = "1 13"
	day_map["4 4"] = "1 14"
	day_map["4 5"] = "1 15"
	day_map["4 6"] = "1 16"
	day_map["4 7"] = "1 17"
	day_map["4 8"] = "1 18"
	day_map["4 9"] = "1 19"
	day_map["4 10"] = "1 20"
	day_map["4 11"] = "1 21"
	day_map["4 12"] = "1 22"
	day_map["4 13"] = "1 23"
	day_map["4 14"] = "1 24"
	day_map["4 15"] = "1 25"
	day_map["4 16"] = "1 26"
	day_map["4 17"] = "1 27"
	day_map["4 18"] = "1 28"
	day_map["4 19"] = "1 29"
	day_map["4 20"] = "1 30"
	day_map["4 21"] = "1 31"
	day_map["4 22"] = "1 32"
	day_map["4 23"] = "1 33"
	day_map["4 24"] = "1 34"
	day_map["4 25"] = "1 35"
	day_map["4 26"] = "1 36"
	day_map["4 27"] = "1 37"
	day_map["4 28"] = "1 38"
	day_map["4 29"] = "1 39"
	day_map["4 30"] = "1 40"
	day_map["5 1"] = "1 41"
	day_map["5 2"] = "1 42"
	day_map["5 3"] = "1 43"
	day_map["5 4"] = "1 44"
	day_map["5 5"] = "1 45"
	day_map["5 6"] = "1 46"
	day_map["5 7"] = "1 47"
	day_map["5 8"] = "1 48"
	day_map["5 9"] = "1 49"
	day_map["5 10"] = "1 50"
	day_map["5 11"] = "1 51"
	day_map["5 12"] = "1 52"
	day_map["5 13"] = "1 53"
	day_map["5 14"] = "1 54"
	day_map["5 15"] = "1 55"
	day_map["5 16"] = "1 56"
	day_map["5 17"] = "1 57"
	day_map["5 18"] = "1 58"
	day_map["5 19"] = "1 59"
	day_map["5 20"] = "1 60"
	day_map["5 21"] = "1 61"
	day_map["5 22"] = "1 62"
	day_map["5 23"] = "1 63"
	day_map["5 24"] = "1 64"
	day_map["5 25"] = "1 65"
	day_map["5 26"] = "1 66"
	day_map["5 27"] = "1 67"
	day_map["5 28"] = "1 68"
	day_map["5 29"] = "1 69"
	day_map["5 30"] = "1 70"
	day_map["5 31"] = "1 71"
	day_map["6 1"] = "1 72"
	day_map["6 2"] = "1 73"
	day_map["6 3"] = "1 74"
	day_map["6 4"] = "1 75"
	day_map["6 5"] = "1 76"
	day_map["6 6"] = "1 77"
	day_map["6 7"] = "1 78"
	day_map["6 8"] = "1 79"
	day_map["6 9"] = "1 80"
	day_map["6 10"] = "1 81"
	day_map["6 11"] = "1 82"
	day_map["6 12"] = "1 83"
	day_map["6 13"] = "1 84"
	day_map["6 14"] = "1 85"
	day_map["6 15"] = "1 86"
	day_map["6 16"] = "1 87"
	day_map["6 17"] = "1 88"
	day_map["6 18"] = "1 89"
	day_map["6 19"] = "1 90"
	day_map["6 20"] = "2 0"
	day_map["6 21"] = "2 1"
	day_map["6 22"] = "2 2"
	day_map["6 23"] = "2 3"
	day_map["6 24"] = "2 4"
	day_map["6 25"] = "2 5"
	day_map["6 26"] = "2 6"
	day_map["6 27"] = "2 7"
	day_map["6 28"] = "2 8"
	day_map["6 29"] = "2 9"
	day_map["6 30"] = "2 10"
	day_map["7 1"] = "2 11"
	day_map["7 2"] = "2 12"
	day_map["7 3"] = "2 13"
	day_map["7 4"] = "2 14"
	day_map["7 5"] = "2 15"
	day_map["7 6"] = "2 16"
	day_map["7 7"] = "2 17"
	day_map["7 8"] = "2 18"
	day_map["7 9"] = "2 19"
	day_map["7 10"] = "2 20"
	day_map["7 11"] = "2 21"
	day_map["7 12"] = "2 22"
	day_map["7 13"] = "2 23"
	day_map["7 14"] = "2 24"
	day_map["7 15"] = "2 25"
	day_map["7 16"] = "2 26"
	day_map["7 17"] = "2 27"
	day_map["7 18"] = "2 28"
	day_map["7 19"] = "2 29"
	day_map["7 20"] = "2 30"
	day_map["7 21"] = "2 31"
	day_map["7 22"] = "2 32"
	day_map["7 23"] = "2 33"
	day_map["7 24"] = "2 34"
	day_map["7 25"] = "2 35"
	day_map["7 26"] = "2 36"
	day_map["7 27"] = "2 37"
	day_map["7 28"] = "2 38"
	day_map["7 29"] = "2 39"
	day_map["7 30"] = "2 40"
	day_map["7 31"] = "2 41"
	day_map["8 1"] = "2 42"
	day_map["8 2"] = "2 43"
	day_map["8 3"] = "2 44"
	day_map["8 4"] = "2 45"
	day_map["8 5"] = "2 46"
	day_map["8 6"] = "2 47"
	day_map["8 7"] = "2 48"
	day_map["8 8"] = "2 49"
	day_map["8 9"] = "2 50"
	day_map["8 10"] = "2 51"
	day_map["8 11"] = "2 52"
	day_map["8 12"] = "2 53"
	day_map["8 13"] = "2 54"
	day_map["8 14"] = "2 55"
	day_map["8 15"] = "2 56"
	day_map["8 16"] = "2 57"
	day_map["8 17"] = "2 58"
	day_map["8 18"] = "2 59"
	day_map["8 19"] = "2 60"
	day_map["8 20"] = "2 61"
	day_map["8 21"] = "2 62"
	day_map["8 22"] = "2 63"
	day_map["8 23"] = "2 64"
	day_map["8 24"] = "2 65"
	day_map["8 25"] = "2 66"
	day_map["8 26"] = "2 67"
	day_map["8 27"] = "2 68"
	day_map["8 28"] = "2 69"
	day_map["8 29"] = "2 70"
	day_map["8 30"] = "2 71"
	day_map["8 31"] = "2 72"
	day_map["9 1"] = "2 73"
	day_map["9 2"] = "2 74"
	day_map["9 3"] = "2 75"
	day_map["9 4"] = "2 76"
	day_map["9 5"] = "2 77"
	day_map["9 6"] = "2 78"
	day_map["9 7"] = "2 79"
	day_map["9 8"] = "2 80"
	day_map["9 9"] = "2 81"
	day_map["9 10"] = "2 82"
	day_map["9 11"] = "2 83"
	day_map["9 12"] = "2 84"
	day_map["9 13"] = "2 85"
	day_map["9 14"] = "2 86"
	day_map["9 15"] = "2 87"
	day_map["9 16"] = "2 88"
	day_map["9 17"] = "2 89"
	day_map["9 18"] = "2 90"
	day_map["9 19"] = "3 0"
	day_map["9 20"] = "3 1"
	day_map["9 21"] = "3 2"
	day_map["9 22"] = "3 3"
	day_map["9 23"] = "3 4"
	day_map["9 24"] = "3 5"
	day_map["9 25"] = "3 6"
	day_map["9 26"] = "3 7"
	day_map["9 27"] = "3 8"
	day_map["9 28"] = "3 9"
	day_map["9 29"] = "3 10"
	day_map["9 30"] = "3 11"
	day_map["10 1"] = "3 12"
	day_map["10 2"] = "3 13"
	day_map["10 3"] = "3 14"
	day_map["10 4"] = "3 15"
	day_map["10 5"] = "3 16"
	day_map["10 6"] = "3 17"
	day_map["10 7"] = "3 18"
	day_map["10 8"] = "3 19"
	day_map["10 9"] = "3 20"
	day_map["10 10"] = "3 21"
	day_map["10 11"] = "3 22"
	day_map["10 12"] = "3 23"
	day_map["10 13"] = "3 24"
	day_map["10 14"] = "3 25"
	day_map["10 15"] = "3 26"
	day_map["10 16"] = "3 27"
	day_map["10 17"] = "3 28"
	day_map["10 18"] = "3 29"
	day_map["10 19"] = "3 30"
	day_map["10 20"] = "3 31"
	day_map["10 21"] = "3 32"
	day_map["10 22"] = "3 33"
	day_map["10 23"] = "3 34"
	day_map["10 24"] = "3 35"
	day_map["10 25"] = "3 36"
	day_map["10 26"] = "3 37"
	day_map["10 27"] = "3 38"
	day_map["10 28"] = "3 39"
	day_map["10 29"] = "3 40"
	day_map["10 30"] = "3 41"
	day_map["10 31"] = "3 42"
	day_map["11 1"] = "3 43"
	day_map["11 2"] = "3 44"
	day_map["11 3"] = "3 45"
	day_map["11 4"] = "3 46"
	day_map["11 5"] = "3 47"
	day_map["11 6"] = "3 48"
	day_map["11 7"] = "3 49"
	day_map["11 8"] = "3 50"
	day_map["11 9"] = "3 51"
	day_map["11 10"] = "3 52"
	day_map["11 11"] = "3 53"
	day_map["11 12"] = "3 54"
	day_map["11 13"] = "3 55"
	day_map["11 14"] = "3 56"
	day_map["11 15"] = "3 57"
	day_map["11 16"] = "3 58"
	day_map["11 17"] = "3 59"
	day_map["11 18"] = "3 60"
	day_map["11 19"] = "3 61"
	day_map["11 20"] = "3 62"
	day_map["11 21"] = "3 63"
	day_map["11 22"] = "3 64"
	day_map["11 23"] = "3 65"
	day_map["11 24"] = "3 66"
	day_map["11 25"] = "3 67"
	day_map["11 26"] = "3 68"
	day_map["11 27"] = "3 69"
	day_map["11 28"] = "3 70"
	day_map["11 29"] = "3 71"
	day_map["11 30"] = "3 72"
	day_map["12 1"] = "3 73"
	day_map["12 2"] = "3 74"
	day_map["12 3"] = "3 75"
	day_map["12 4"] = "3 76"
	day_map["12 5"] = "3 77"
	day_map["12 6"] = "3 78"
	day_map["12 7"] = "3 79"
	day_map["12 8"] = "3 80"
	day_map["12 9"] = "3 81"
	day_map["12 10"] = "3 82"
	day_map["12 11"] = "3 83"
	day_map["12 12"] = "3 84"
	day_map["12 13"] = "3 85"
	day_map["12 14"] = "3 86"
	day_map["12 15"] = "3 87"
	day_map["12 16"] = "3 88"
	day_map["12 17"] = "3 89"
	day_map["12 18"] = "3 90"
	day_map["12 19"] = "4 0"
	day_map["12 20"] = "4 1"
	day_map["12 21"] = "4 2"
	day_map["12 22"] = "4 3"
	day_map["12 23"] = "4 4"
	day_map["12 24"] = "4 5"
	day_map["12 25"] = "4 6"
	day_map["12 26"] = "4 7"
	day_map["12 27"] = "4 8"
	day_map["12 28"] = "4 9"
	day_map["12 29"] = "4 10"
	day_map["12 30"] = "4 11"
	day_map["12 31"] = "4 12"
}

{
	split($1, date_parts, "-")

	year  = date_parts[1]
	month = date_parts[2] + 0
	day   = date_parts[3] + 0

	year_is_leap = ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
	first_mo_gday = year_is_leap ? 20 : 21

	if (month <= 2 || (month == 3 && day < first_mo_gday)) {
		mo_year = year - 2025
	} else {
		mo_year = year - 2024
	}

	map_key = month " " day

	if (year_is_leap) {
		split(leap_day_map[map_key], mo_date, " ")
	} else {
		split(day_map[map_key], mo_date, " ")
	}

	mo_month = mo_date[1]
	mo_day = mo_date[2]

	if (mo_day == 91 && mo_month == 4) {
		print "Mekadimo Day, " mo_year
	} else if (mo_day == 91 && mo_month == 2) {
		print "Datakoro Day, " mo_year
	} else {
		mo_month_name = month_names[mo_month]
		print mo_month_name " " mo_day ", " mo_year
	}
}
