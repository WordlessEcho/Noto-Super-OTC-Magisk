# Fork from https://github.com/simonsmh/notocjk/blob/master/customize.sh
[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
FILES="fonts.xml fonts_base.xml"
FILEPATH=/system/etc/
FONTPATH=/system/fonts/
MINSDK=24
MINVER="7.0(Nougat)"
SANSNAME=NotoSansCJK-Android.ttc
SERIFNAME=NotoSerifCJK-Android.ttc
CHECKSANSSUM=$SANSNAME.sha256
REALSANSSUM=$SANSNAME.caculated.sha256
CHECKSERIFSUM=$SERIFNAME.sha256
REALSERIFSUM=$SERIFNAME.caculated.sha256
TIMES=0

for FILE in $FILES
do
    if [ "$API" -ge "$MINSDK" ] && [ -f $MIRRORPATH$FILEPATH$FILE ]; then
        TIMES=$((TIMES+1))
        if [ ! -f $MODPATH$FONTPATH$SANSNAME ]; then
            ui_print "- Merging $SANSNAME"
            cat $MODPATH$FONTPATH$SANSNAME.part* > $MODPATH$FONTPATH$SANSNAME
            sha256sum $MODPATH$FONTPATH$SANSNAME | awk '{print $1}' > $MODPATH$FONTPATH$REALSANSSUM

            if ! cmp -s $MODPATH$FONTPATH$CHECKSANSSUM $MODPATH$FONTPATH$REALSANSSUM; then
                abort "! File corrupted. Please re-download this module"
            else
                ui_print "- cleaning caches"
                rm $MODPATH$FONTPATH$SANSNAME.* 2> /dev/null
            fi
        fi

        if [ "$API" -ge "28" ]; then
            if [ ! -f $MODPATH$FONTPATH$SERIFNAME ]; then
                ui_print "- Merging $SERIFNAME"
                cat $MODPATH$FONTPATH$SERIFNAME.part* > $MODPATH$FONTPATH$SERIFNAME
                sha256sum $MODPATH$FONTPATH$SERIFNAME | awk '{print $1}' > $MODPATH$FONTPATH$REALSERIFSUM

                if ! cmp -s $MODPATH$FONTPATH$CHECKSERIFSUM $MODPATH$FONTPATH$REALSERIFSUM; then
                    abort "! File corrupted. Please re-download this module"
                else
                    ui_print "- cleaning caches"
                    rm $MODPATH$FONTPATH$SERIFNAME.* 2> /dev/null
                fi
            fi

            ui_print "- Migrating $FILE"
            mkdir -p $MODPATH$FILEPATH
            cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hans\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hans">\n        <font weight="100" style="normal" index="2">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="12">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="27">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="17">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="37">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="22">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="2" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="6" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="10" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="14" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="18" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="22" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="26" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Bopo">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant zh-Bopo">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant,zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant,zh-Bopo">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ja\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ja\">.*Noto.*CJK.*<\/family>/<family lang="ja">\n        <font weight="100" style="normal" index="0">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="5">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="10">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="25">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="35">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="20">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="0" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="8" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="12" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="16" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="20" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="24" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ko\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ko\">.*Noto.*CJK.*<\/family>/<family lang="ko">\n        <font weight="100" style="normal" index="1">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="6">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="11">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="26">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="16">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="36">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="21">NotoSansCJK-Android.ttc<\/font>\n\n        <font weight="200" style="normal" index="1" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="5" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="9" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="13" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="17" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="21" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="25" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE
        else
            if [ -f $MODPATH$FONTPATH$CHECKSERIFSUM ]; then
                ui_print "- Your Android is lower than 9.0(Pie) that doesn't support fallbackFor. Install $SANSNAME only."
                rm $MODPATH$FONTPATH$SERIFNAME.*
            fi

            ui_print "- Migrating $FILE"
            mkdir -p $MODPATH$FILEPATH
            cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hans\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hans">\n        <font weight="100" style="normal" index="2">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="12">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="27">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="17">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="37">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="22">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Bopo">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant zh-Bopo">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant,zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant,zh-Bopo">\n        <font weight="100" style="normal" index="3">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="8">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="13">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="28">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="18">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="38">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="23">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ja\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ja\">.*Noto.*CJK.*<\/family>/<family lang="ja">\n        <font weight="100" style="normal" index="0">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="5">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="10">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="25">NotoSansCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="35">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="20">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ko\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ko\">.*Noto.*CJK.*<\/family>/<family lang="ko">\n        <font weight="100" style="normal" index="1">NotoSansCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="6">NotoSansCJK-Android.ttc<\/font>\n        <font weight="350" style="normal" index="11">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="26">NotoSansCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="16">NotoSansCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="36">NotoSansCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="21">NotoSansCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE
        fi
    fi
done

if [ "$TIMES" -lt "1" ]; then
    abort "! Migration FAILED. Or your Android version is lower than $MINVER. Nothing have done to your system."
fi
