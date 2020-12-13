class Plugin
  def Plugin.load(path)
    plugin = new()
    plugin.instance_eval File.read(path)
    plugin
  end
  def get_instance
    @instance
  end
end

def release(prisonar1, prisonar2)
  result = (0..9).to_a
  score = [0, 0]
  round = 0
  prisonar1_before_answer = 0
  prisonar2_before_answer = 0
  result.each {|m|
    prisonar1_answer = prisonar1.answer(round, prisonar2_before_answer)
    prisonar2_answer = prisonar2.answer(round, prisonar2_before_answer)
    # 2人とも協調
    if (prisonar1_answer == 0 && prisonar2_answer == 0) then
      score[0] = score[0] + 2
      score[1] = score[1] + 2
    end
    # 2人とも裏切り
    if (prisonar1_answer == 1 && prisonar2_answer == 1) then
      score[0] = score[0] + 1
      score[1] = score[1] + 1
    end
    # 1人目が裏切り
    if (prisonar1_answer == 1 && prisonar2_answer == 0) then
      score[0] = score[0] + 3
    end
    # 2人目が裏切り
    if (prisonar1_answer == 0 && prisonar2_answer == 1) then
      score[1] = score[1] + 3
    end
    round = round + 1
  }
  puts "prisonar1.rbのスコア:" + score[0].to_s
  puts "prisonar2.rbのスコア:" + score[1].to_s
end

p1 = Plugin.load("prisonar1.rb")
p2 = Plugin.load("prisonar2.rb")

release(p1.get_instance(), p2.get_instance())
