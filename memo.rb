require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  puts "メモを入力してください"
  memo_text = gets.chomp
  puts "拡張子を除いたファイル名を入力してください"
  memo_file = "#{gets.chomp}.csv"
  begin
    memo_input = CSV.read(memo_file)
  rescue
    CSV.open(memo_file, "w") do |csv|
      csv << [memo_text]
    end
    puts "書き込みました"
  else
    puts "ファイルが既に存在しているので、書き込めません"
  end

elsif memo_type == 2
  puts "拡張子を除いたファイル名を入力してください"
  memo_file = "#{gets.chomp}.csv"
  begin
    memo_input = CSV.read(memo_file)
  rescue
    puts "ファイルがありません"
  else
    puts "メモの中身は以下のとおりです"
    puts memo_input
    puts "追記するメモを入力してください"
    memo_text = gets.chomp
    CSV.open(memo_file, "a") do |csv|
      csv << [memo_text]
    end
    puts "書き込みました"
  end
else
  puts "1か2を入力してください"
end