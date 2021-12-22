# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
    def hand
      # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
      puts "Please enter a number."
      puts "0: Rock"
      puts "1: Scissors"
      puts "2: Paper"
      # 変数「input_hand」にプレイヤーの入力値を代入します。
      # ヒント：getsメソッドについて調べてみましょう。
      input_hand = gets.to_i
      # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
      #puts "Nombre saisie #{input_hand}"
      isValideInput = true
      while isValideInput
        # if 「input_hand」が「0, 1, 2」のいずれかの場合だった場合
        if ([0, 1, 2].include?(input_hand)) #(input_hand <= 2 ) #(input_hand == 0 || input_hand == 1 || input_hand == 2 )# 
        # ヒント：include?メソッドについて調べてみましょう。
          # 「input_hand」をそのまま返す。
          # ヒント：戻り値を返して繰り返し処理を終了させたい場合、「return」を使用します。
          isValideInput = false
        else 
          # プレイヤーに「0〜2」を入力させる文章を表示させる。
          puts "0〜2のPlease enter a number."
          puts "0: Rock"
          puts "1: Scissors"
          puts "2: Paper"
          # 変数「input_hand」にプレイヤーの入力値を代入します。
          input_hand = gets.to_i
        end #if statement end
      end
      puts "your chose is #{input_hand}"
      input_hand
    end
end
# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
    def hand
      # Goo、Choki、Parの値をランダムに取得する。
        enemyHand = rand(0..2)
        puts "Computer chose is #{enemyHand}"
        enemyHand
    end
end
# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
    def pon(player_hand, enemy_hand)
      # Substitute ["goo", "choki", "par"] for the variable "janken".
      result = ((player_hand - enemy_hand) + 3) % 3
      #janken = ["Rock", "Scissors", "Paper"]
      #「相手の手は#{相手の手}です。」と出力させます。
      #puts "相手の手は#{janken[enemy_hand]}です。"
      #Create logic to play rock-paper-scissors from the return value of the Player class and the return value of the Enemy class.
      if result == 1
        puts "You lost"
      elsif result == 2
        puts "You win"
      else
        puts "Draw, try agains"
        GameStart.jankenpon
      end
    end
end
  # Write the logic to execute the rock-paper-scissors game.
class GameStart
    # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
    def self.jankenpon
      #Substitute the instantiated Player for the variable "player".
      player = Player.new
      # Assign an instantiation of Enemy to the variable "enemy".
      enemy = Enemy.new
      # Assign an instantiation of Janken to the variable "janken".
      janken = Janken.new
      # 変数「next_game」に「true」を代入しましょう。
      next_game = true
      # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
      while next_game
        # Substitute the value (return value) returned by executing rock-paper-scissors into the variable "next_game".
        #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        next_game = janken.pon(player.hand, enemy.hand)
      end
    end
end
# Call the jankenpon method with the class name.
  GameStart.jankenpon