#!/usr/bin/env bash

usage="Usage: $0 Rite(NOE|VOE) Year(YYYY)";

if [ $# -ne 2 ]; then
    echo "${usage}";
    exit 1;
fi;

rite="${1}";
year="${2}";
outfile="${rite}_Ordo-${year}.txt";

case $rite in
    NOE)
        curl http://www.universalis.com/europe.england.portsmouth/${year}0101/vcalendar.ics\
            | tac\
            | tac\
            | /bin/grep -E "^SUMMARY"\
            | perl -lpe 's/SUMMARY://'\
            | perl -lpe 's/,\\n/|/g'\
            | perl -lpe 's/ or //g'\
            | perl -lpe "s/of the (\d+).. week of /of week \1 of /"\
            | perl -lpe "s/(17 December)(.*)/\1:O Wisdom\2/"\
            | perl -lpe "s/(18 December)(.*)/\1:O Adonai\2/"\
            | perl -lpe "s/(19 December)(.*)/\1:O Root of Jesse\2/"\
            | perl -lpe "s/(20 December)(.*)/\1:O Key of David\2/"\
            | perl -lpe "s/(21 December)(.*)/\1:O Dawn of the East\2/"\
            | perl -lpe "s/(22 December)(.*)/\1:O King of the Nations\2/"\
            | perl -lpe "s/(23 December)(.*)/\1:O Emmanuel\2/"\
            | perl -lpe "s/(\d+).. day within the .ctave of Christmas/Christmas Octave \1/"\
            | perl -lpe "s/(\d+).. Sunday (of|in) /Sunday of week \1 \2 /"\
            | perl -lpe "s/(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) of .eek (\d+) of (Advent|Lent|Eastertide|Easter)/\3 \2:\1/"\
            | perl -lpe "s/(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) of .eek (\d+) in Ordinary Time/Ordinary Time \2:\1/"\
            | perl -lpe "s/Baptism of the Lord/Ordinary Time 1:Sunday (Baptism of our Lord)/"\
            | perl -lpe "s/Divine Mercy Sunday.+/Easter 2:Sunday (Divine Mercy)/"\
            | perl -lpe "s/Eastertide 6:(Friday.*)/Ascensiontide 1:\1/"\
            | perl -lpe "s/Eastertide 6:(Saturday.*)/Ascensiontide 1:\1/"\
            | perl -lpe "s/Eastertide 7:(.+)/Ascensiontide 2:\1/"\
            | perl -lpe "s/of the Blessed Virgin Mary/of our Lady/"\
            | perl -lpe "s/Annunciation of the Lord/Annunciation to our Lady/"\
            | perl -lpe "s/ \(commemoration of (.+)\)/\1/"\
            | perl -lpe "s/^Saint /St /"\
            | perl -lpe "s/\|Saint /\|St /g"\
            | perl -lpe "s/^Saints /Ss /"\
            | perl -lpe "s/\|Saints /\|Ss /g"\
            | perl -lpe "s/\,* and (his|their) Companions/ \& Companions/g"\
            | perl -lpe "s/\,* and Doctor of the Church/\, Doctor/g"\
            | perl -lpe "s/ and Missionary/\, Missionary/g"\
            | perl -lpe "s/priest/Priest/g"\
            | perl -lpe "s/(the)* first .artyr/Protomartyr/g"\
            | perl -lpe "s/ and / \& /g"\
            | perl -lpe "s/^The //g"\
            | perl -lpe "s/\|The /\|/g"\
            | /bin/sed -E "s/^/${rite}\t/" >| $outfile;
        echo "Wrote ${outfile}";;
    VOE)
        curl http://www.universalis.com/europe.england.ordinariate/${year}0101/vcalendar.ics\
            | tac\
            | tac\
            | /bin/grep -E "^SUMMARY"\
            | perl -pe 's/SUMMARY://'\
            | perl -pe 's/,\\n/|/g'\
            | perl -pe 's/ or //g'\
            | perl -lpe "s/of the (\d+).. week of /of week \1 of /"\
            | perl -lpe "s/(\d+).. day within the .ctave of Christmas/Christmas Octave \1/"\
            | perl -lpe "s/(17 December)(.*)/\1:O Sapientia\2/"\
            | perl -lpe "s/(18 December)(.*)/\1:O Adonai\2/"\
            | perl -lpe "s/(19 December)(.*)/\1:O Radix Jesse\2/"\
            | perl -lpe "s/(20 December)(.*)/\1:O Clavis David\2/"\
            | perl -lpe "s/(21 December)(.*)/\1:O Oriens\2/"\
            | perl -lpe "s/(22 December)(.*)/\1:O Rex Gentium\2/"\
            | perl -lpe "s/(23 December)(.*)/\1:O Emmanuel\2/"\
            | perl -lpe "s/Baptism of the Lord/Epiphanytide I:Sunday (Baptism of our Lord)/"\
            | perl -lpe "s/(\d+).. Sunday (of|in) /Sunday of week \1 \2 /"\
            | perl -lpe "s/(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) of .eek (\d+) of (Advent|Lent|Eastertide|Easter)/\3 \2:\1/"\
            | perl -lpe "s/(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) in the .eek after Epiphany/Epiphanytide I:\1/"\
            | perl -lpe "s/(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) after the Most Holy Trinity/Trinitytide I:\1/"\
            | perl -lpe "s/(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) after the (.+?) Sunday after (Epiphany|Trinity)/\3tide \2:\1/"\
            | perl -lpe "s/(.+?) Sunday after (Epiphany|Trinity)/\2tide \1:Sunday/"\
            | perl -lpe "s/^.*?Sunday.+?before Lent \((.+gesima)\)/\1 Sunday/"\
            | perl -lpe "s/(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) after (.+?gesima)/\2 \1/"\
            | perl -lpe "s/(Advent|Lent) 1/\1 I/"\
            | perl -lpe "s/(Advent|Lent) 2/\1 II/"\
            | perl -lpe "s/(Advent|Lent) 3/\1 III/"\
            | perl -lpe "s/(Advent|Lent) 4/\1 IV/"\
            | perl -lpe "s/Lent 5:Sunday/Lent IV:Passion Sunday/"\
            | perl -lpe "s/Lent 5:(.+)/Passiontide:\1/"\
            | perl -lpe "s/Divine Mercy Sunday.+/Eastertide II:Sunday (Divine Mercy)/"\
            | perl -lpe "s/(Eastertide|Easter) 2/Eastertide II/"\
            | perl -lpe "s/(Eastertide|Easter) 3/Eastertide III/"\
            | perl -lpe "s/(Eastertide|Easter) 4/Eastertide IV/"\
            | perl -lpe "s/(Eastertide|Easter) 5/Eastertide V/"\
            | perl -lpe "s/(Eastertide|Easter) 6:Friday/Ascension Friday/"\
            | perl -lpe "s/(Eastertide|Easter) 6:Saturday/Ascension Saturday/"\
            | perl -lpe "s/(Eastertide|Easter) 6/Eastertide VI/"\
            | perl -lpe "s/(Eastertide|Easter) 7/Ascensiontide II/"\
            | perl -lpe "s/tide First/tide I/"\
            | perl -lpe "s/tide Second/tide II/"\
            | perl -lpe "s/tide Third/tide III/"\
            | perl -lpe "s/tide Fourth/tide IV/"\
            | perl -lpe "s/tide Fifth/tide V/"\
            | perl -lpe "s/tide Sixth/tide VI/"\
            | perl -lpe "s/tide Seventh/tide VII/"\
            | perl -lpe "s/tide Eighth/tide VIII/"\
            | perl -lpe "s/tide Ninth/tide IX/"\
            | perl -lpe "s/tide Tenth/tide X/"\
            | perl -lpe "s/tide Eleventh/tide XI/"\
            | perl -lpe "s/tide Twelfth/tide XII/"\
            | perl -lpe "s/tide Thirteenth/tide XIII/"\
            | perl -lpe "s/tide Fourteenth/tide XIV/"\
            | perl -lpe "s/tide Fifteenth/tide XV/"\
            | perl -lpe "s/tide Sixteenth/tide XVI/"\
            | perl -lpe "s/tide Seventeenth/tide XVII/"\
            | perl -lpe "s/tide Eighteenth/tide XVIII/"\
            | perl -lpe "s/tide Nineteenth/tide XIX/"\
            | perl -lpe "s/tide Twentieth/tide XX/"\
            | perl -lpe "s/tide Twenty-.irst/tide XXI/"\
            | perl -lpe "s/tide Twenty-.econd/tide XXII/"\
            | perl -lpe "s/tide Twenty-.hird/tide XXIII/"\
            | perl -lpe "s/tide Twenty-.ourth/tide XXIV/"\
            | perl -lpe "s/tide Twenty-.ifth/tide XXV/"\
            | perl -lpe "s/tide Twenty-.ixth/tide XXVI/"\
            | perl -lpe "s/tide Twenty-.eventh/tide XXVII/"\
            | perl -lpe "s/of the Blessed Virgin Mary/of our Lady/"\
            | perl -lpe "s/Annunciation of the Lord/Annunciation to our Lady/"\
            | perl -lpe "s/ \(commemoration of (.+)\)/\1/"\
            | perl -lpe "s/^Saint /St /"\
            | perl -lpe "s/\|Saint /\|St /g"\
            | perl -lpe "s/^Saints /Ss /"\
            | perl -lpe "s/\|Saints /\|Ss /g"\
            | perl -lpe "s/\,* and (his|their) Companions/ \& Companions/g"\
            | perl -lpe "s/\,* and Doctor of the Church/\, Doctor/g"\
            | perl -lpe "s/ and Missionary/\, Missionary/g"\
            | perl -lpe "s/priest/Priest/g"\
            | perl -lpe "s/(the)* first .artyr/Protomartyr/g"\
            | perl -lpe "s/ and / \& /g"\
            | perl -lpe "s/^The //g"\
            | perl -lpe "s/\|The /\|/g"\
            | /bin/sed -E "s/^/${rite}\t/" >| $outfile;
        echo "Wrote ${outfile}";;
    VOL)
        echo "Not yet supported";;
    *)
        echo "${usage}";;
esac

