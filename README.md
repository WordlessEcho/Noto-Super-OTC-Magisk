# Noto CJK Fonts Installer (Super OTC)
This is a module add more font weight for CJK(Chinese, Japanese and Korean) by modify the `fonts.xml`.

By putting the charater into a single file, it reduce some space compare to install fonts for each languages. That is super OTC font.

# Installation
You need at least Android 7(Nougat) to use super OTC.

Go [releases](https://github.com/WordlessEcho/Noto-Super-OTC-Installer/releases) to download this module and install in Magisk.

[Try](https://github.com/RikkaApps/FontProvider/releases/tag/v1.0.7)

# Developer
We **strongly** recommend you use `textFontWeight` as possible.

DemiLight is Normal in Source Han Sans. More about DemiLight: [思源黑体的 DemiLight / Normal 字重因何而生？ - 孫志貴的回答 - 知乎](https://www.zhihu.com/question/24607502/answer/28362461)

## sans-serif

*Note: Roboto is variable font since Android 12.*

| textFontWeight | textFontWeight | latin | CJK |
| --- | --- | --- | --- |
| 100 | sans-serif-thin | Roboto Thin | Noto Sans CJK Thin |
| 300 | sans-serif-light | Roboto Light | Noto Sans CJK Light |
| 350 | (None) | (None) | Noto Sans CJK Demi-light |
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
