# Noto CJK Fonts Installer (Super OTC)
This is a module add more font weight for CJK(Chinese, Japanese and Korean) by modify the `fonts.xml`.
By putting the charater to a single file, it reduce some space compare to install fonts for each languages.
That is super OTC font.

# Installation
You need at least Android 7(Nougat) to use super OTC.
- Download [NotoSansCJK.ttc.zip](https://github.com/googlefonts/noto-cjk/raw/master/NotoSansCJK.ttc.zip).
- For **Android 9(Pie) or above**, download both of [NotoSansCJK.ttc.zip](https://github.com/googlefonts/noto-cjk/raw/master/NotoSansCJK.ttc.zip) 
and [NotoSerifCJK.ttc.zip](https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJK.ttc.zip).
- Unzip the `.ttc` font files to `/sdcard/Download/`.
- Go [releases](https://github.com/WordlessEcho/Noto-Super-OTC-Installer/releases) to download this module and install in Magisk.

Enjoy! Pay attation to app title bar, drawer and Wikipedia(for Android 9+).

# Developer
- API28+: Use `textFontWeight` to specify font weight.
- API28-: We add a alias for Noto Sans CJK DemiLight. Set `fontFamily` to `sans-serif-demi-light`.

We **strongly** recommend you use `textFontWeight` as possible.

## sans-serif

| textFontWeight | textFontWeight | latin | CJK |
| --- | --- | --- | --- |
| 100 | sans-serif-thin | Roboto Thin | Noto Sans CJK Thin |
| 300 | sans-serif-light | Roboto Light | Noto Sans CJK Light |
| 350 | **sans-serif-demi-light** | (None) | Noto Sans CJK Demi-light |
| 400 | sans-serif | Roboto Regular | Noto Sans CJK Regular |
| 500 | sans-serif-medium | Roboto Medium | Noto Sans CJK Medium |
| 900 | sans-serif-black | Roboto Black | Noto Sans CJK Black |
| 700 | (`textStyle=bold`) | Roboto Bold | Noto Sans CJK Bold |
| *(each weight above) | (`textStyle=italic`) | Roboto * Italic | (None) |

## serif

| textFontWeight | textFontWeight | latin | CJK |
| --- | --- | --- | --- |
| 200 | (None) | (None) | Noto Serif CJK Extra-light |
| 300 | (None) | (None) | Noto Serif CJK Light |
| 400 | serif | Noto Serif Regular | Noto Serif CJK Regular |
| 500 | (None) | (None) | Noto Serif CJK Medium |
| 600 | (None) | (None) | Noto Serif CJK Semi-bold |
| 900 | (None) | (None) | Noto Serif CJK Black |
| 700 | serif-bold | Noto Serif Bold | Noto Serif CJK Bold |
| 400 | (`textStyle=italic`) | Noto Serif Italic | (None) |
| 700 | (`textStyle=italic`) | Noto Serif Bold Italic | (None) |
