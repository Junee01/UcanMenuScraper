#동덕여자대학교
class DONGDUK
  def initialize
    
    #URL
    @dongduk_url = "http://www.dongduk.ac.kr/front/cafeteria.do"
    #Parsing to <HTML> with Nokogiri
    @dongduk_data = Nokogiri::HTML(open(@dongduk_url))
    
    #Mon to Fri
    @default_dates = Array.new
    (1..5).each do |i|
      @default_dates << Date.today.year.to_s + "-" + Date.today.month.to_s + "-" + @dongduk_data.css('div.gradient')[0].css('thead tr th')[i].text.scan(/\d/).join('')
    end

  end

  def scrape
    
    #옛향 조식
    target = @dongduk_data.css('div.gradient')[0].css('tbody tr')[0].css('td')
    i = 0
    target.each do |t|
      if t.text.strip[0] != '옛' && t.text.strip[1] != '향'
        Diet.create(
          :univ_id => 1,
          :name => '옛향',
          :location => '학생식당',
          :date => @default_dates[i],
          :time => 'breakfast',
          :diet => JSON.generate({:name => t.text.strip.gsub("\n",","), :price => "2900"}),
          :extra => ''
          )
      else
        next
      end
      i += 1
    end

    #옛향 중식
    target = @dongduk_data.css('div.gradient')[0].css('tbody tr')[1].css('td')
    i = 0
    target.each do |t|
      if t.text.strip[0] != '옛' && t.text.strip[1] != '향'
        Diet.create(
          :univ_id => 1,
          :name => '옛향',
          :location => '학생식당',
          :date => @default_dates[i],
          :time => 'lunch',
          :diet => JSON.generate({:name => t.text.strip.gsub("\n",","), :price => "2900"}),
          :extra => ''
          )
      else
        next
      end
      i += 1
    end

    #옛향 석식
    target = @dongduk_data.css('div.gradient')[0].css('tbody tr')[2].css('td')
    i = 0
    target.each do |t|
      if t.text.strip[0] != '옛' && t.text.strip[1] != '향'
        Diet.create(
          :univ_id => 1,
          :name => '옛향',
          :location => '학생식당',
          :date => @default_dates[i],
          :time => 'dinner',
          :diet => JSON.generate({:name => t.text.strip.gsub("\n",","), :price => "2900"}),
          :extra => ''
          )
      else
        next
      end
      i += 1
    end

    #참미소
    target = @dongduk_data.css('div.gradient')[0].css('tbody tr')[3].css('td')
    i = 0
    target.each do |t|
      if t.text.strip[0] != '참' && t.text.strip[1] != '미'
        Diet.create(
          :univ_id => 1,
          :name => '참미소',
          :location => '학생식당',
          :date => @default_dates[i],
          :time => 'breakfast',
          :diet => JSON.generate({:name => t.text.strip.gsub("\n",","), :price => "1000~3400"}),
          :extra => ''
          )
      else
        next
      end
      i += 1
    end

    #덮고볶고
    target = @dongduk_data.css('div.gradient')[0].css('tbody tr')[4].css('td')
    i = 0
    target.each do |t|
      if t.text.strip[0] != '덮' && t.text.strip[1] != '고'
        Diet.create(
          :univ_id => 1,
          :name => '덮고볶고',
          :location => '학생식당',
          :date => @default_dates[i],
          :time => 'breakfast',
          :diet => JSON.generate({:name => t.text.strip.gsub("\n",","), :price => "3400~3600"}),
          :extra => ''
          )
      else
        next
      end
      i += 1
    end

    #가스야
    target = @dongduk_data.css('div.gradient')[0].css('tbody tr')[5].css('td')
    i = 0
    target.each do |t|
      if t.text.strip[0] != '가' && t.text.strip[1] != '스'
        Diet.create(
          :univ_id => 1,
          :name => '가스야',
          :location => '학생식당',
          :date => @default_dates[i],
          :time => 'breakfast',
          :diet => JSON.generate({:name => t.text.strip.gsub("\n",","), :price => "3700~3800"}),
          :extra => ''
          )
      else
        next
      end
      i += 1
    end

  end

end