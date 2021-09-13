# NBS社システムpresentationの使用練習記録

## なぜpresentationなのか
- 刺激の生成・取得・取得データの逐次加工が同時に行えるから

### ファイルの仕組み

- 基本的にはグローバル変数などを設定する部分(beginより上),初期変数などを作成する部分(begin-begin_pcl),プログラム言語として認識される部分(begin_pclより下)の3部分に分かれる

'''sce
[grobal_variable_zone]
begin;
[default_parameter_zone]
----------
----------
-------
begin_pcl;
[raw_coding_zone]
'''

- 簡単な操作に関しては[NBSのtutorial](https://www.neurobs.com/menu_support/menu_help_resources/intro_program)を見るのが一番簡単

### タスク
- 波形配列を作成する
 > 
- 波形配列を電気的なデータとしてDAQに出力する-> DAQに入力するデータ型がどのようなものがいいのか確認する
- 出力した波形データがプログラムで設定した刺激電圧になっているかを確認する
========================
- 電極から記録した電気的なデータをデジタルデータとしてpresentationに保存する
- 保存した電気的シグナルに対して、逐次的に波形を描画できるようにする
- 保存した電気的シグナルに対して、逐次的にデータを加工できるようにする(加算平均波形を出力できるようにしたい)
