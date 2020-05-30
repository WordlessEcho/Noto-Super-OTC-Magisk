# Noto CJK Fonts Installer (Super OTC)
This is a module add more font weight for CJK(Chinese, Japanese and Korean) by modify the `fonts.xml`.
By putting the charater to a single file, it reduce some space compare to install fonts for each languages.
That is super OTC font.

# Installation
You need at least Android 7(Nougat) to use super OTC.
- Download [NotoSansCJK.ttc.zip](https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK.ttc.zip).
- For **Android 9(Pie) or above**, download both of [NotoSansCJK.ttc.zip](https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK.ttc.zip) 
and [NotoSerifCJK.ttc.zip](https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJK.ttc.zip).
- Unzip the `.ttc` font files to `/sdcard/Download/`.
- Go [releases](https://github.com/WordlessEcho/Noto-Super-OTC-Installer/releases) to download this module and install in Magisk.

Enjoy! Pay attation to app title bar, drawer and Wikipedia(for Android 9+).

# Developer
Since API28 add `textFontWeight` for `TextView`. You can simply use demi light by specify `textFontWeight` to 350.
You can use `fontFamily` such as `sans-serif-demi-light` in API28-. Note that Roboto have no 350 demi light font weight.
So it only usable after install this module.

Noto serif (Android built-in) only have regular and bold. But Noto Serif CJK have multiple weight. Check out in
[Google Font](https://fonts.google.com/specimen/Noto+Serif+SC).
