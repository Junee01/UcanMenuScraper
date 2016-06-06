#한양대학교
class HANYANG
	def initialize

	    @default_dates = Array.new
	    
	end
	def scrape

		#학생식당
	    hanyang_erica_url = "https://www.hanyang.ac.kr/upmu/sikdan/sikdan_View.jsp?gb=2&code=2"

	    hanyang_erica_data = Nokogiri::HTML(open(hanyang_erica_url))

		#Mon to Sun
	    (0..6).each do |i|  #일요일까지 있는 경우도 있음.
	      @default_dates << ((Date.parse hanyang_erica_data.css('h3.h3Campus03').text.strip.split('(')[1].split(' ')[0]) + i).to_s
	    end

	    #학생 식당
	    target = hanyang_erica_data.css('div#sikdang table')

	    content = ""
	    i = 0 #날짜별 즉, 테이블
	    target.each do |t|
	      p = 0 #각 메뉴별 즉, <td>
	      t.css('td').each do |part|
	        if (part.nil? || part.text == " ")
	          puts "nothing"
	        elsif (part.text == "중식" || part.text == "석식")
	          puts "nothing"
	        elsif (p % 2 == 1)  #홀수
	          content = part.text
	        elsif (p % 2 == 0) #짝수
	          price = part.text.scan(/\d/).join('')  #price가 완료되면, 객체 생성
	          Diet.create(
	            :univ_id => 4,
	            :name => "학생식당",
	            :location => "복지관2층",
	            :date => @default_dates[i],
	            :time => 'lunch',
	            :diet => JSON.generate({:name => content, :price => price}),
	            :extra => ''
	            )
	        else
	          puts "nothing"
	        end
	        p += 1
	      end
	      i += 1
	      #금요일까지 했으면 끝
	      if (i == 5)
	        break
	      else
	      end
	    end

	    #창의인재원식당
	    hanyang_erica_url = "https://www.hanyang.ac.kr/upmu/sikdan/sikdan_View.jsp?gb=2&code=3"

	    hanyang_erica_data = Nokogiri::HTML(open(hanyang_erica_url))

	    #창의인재원식당
	    target = hanyang_erica_data.css('div#sikdang table')

	    content = ""
	    time = ""
	    i=0
	    target.each do |t|
	      t.css('td').each do |part|
	        if (part.nil? || part.text == " ")
	          puts "nothing"
	        elsif (part.text == "조식")
	          time = 'breakfast'
	        elsif (part.text == "중식")
	          time = 'lunch'
	        elsif (part.text == "석식")
	          time = 'dinner'
	        else
	          content = part.text
	          Diet.create(
	            :univ_id => 4,
	            :name => "창의인재원식당",
	            :location => "창의관1층",
	            :date => @default_dates[i],
	            :time => time,
	            :diet => JSON.generate({:name => content, :price => ''}),
	            :extra => ''
	            )
	        end
	      end
	      i += 1
	      #일요일까지 하고 끝
	      if (i == 7)
	        break
	      else
	      end
	    end

	    #교직원 식당
	    hanyang_erica_url = "https://www.hanyang.ac.kr/upmu/sikdan/sikdan_View.jsp?gb=2&code=1"

	    hanyang_erica_data = Nokogiri::HTML(open(hanyang_erica_url))

	    #교직원 식당
	    target = hanyang_erica_data.css('div#sikdang table')
	    content = ""
	    price = ""
	    time = ""
	    i = 0
	    target.each do |t|
	      t.css('td').each do |part|
	        if (part.nil? || part.text == " ")
	          puts "nothing"
	        elsif (part.text == "조식")
	          time = 'breakfast'
	        elsif (part.text == "중식")
	          time = 'lunch'
	        elsif (part.text == "석식")
	          time = 'dinner'
	        elsif ((part.text.reverse[0..2] =~ /\A\d+\z/) == 0) #숫자로만 이루어져 있다면 마지막 세자리가 숫자라면
	          next
	        else
	          content = part.text
	          price = part.next.next.text.scan(/\d/).join('')
	          Diet.create(
	            :univ_id => 4,
	            :name => "교직원식당",
	            :location => "복지관3층",
	            :date => @default_dates[i],
	            :time => time,
	            :diet => JSON.generate({:name => content, :price => price}),
	            :extra => ''
	            )
	        end
	      end
	      i += 1
	      #금요일까지 하고 끝
	      if (i == 5)
	        break
	      else
	      end
	    end

	    #창업보육센터
	    hanyang_erica_url = "https://www.hanyang.ac.kr/upmu/sikdan/sikdan_View.jsp?gb=2&code=5"

	    hanyang_erica_data = Nokogiri::HTML(open(hanyang_erica_url))

	    #창업보육센터
	    target = hanyang_erica_data.css('div#sikdang table')
	    content = ""
	    price = ""
	    time = ""
	    i = 0

	    target.each do |t|
	      t.css('td').each do |part|
	        if (part.nil? || part.text == " ")
	          puts "nothing"
	        elsif (part.text == "조식")
	          time = 'breakfast'
	        elsif (part.text == "중식")
	          time = 'lunch'
	        elsif (part.text == "석식")
	          time = 'dinner'
	        elsif ((part.text.reverse[0..2] =~ /\A\d+\z/) == 0) #숫자로만 이루어져 있다면 마지막 세자리가 숫자라면
	          next
	        else
	          content = part.text
	          price = part.next.next.text.scan(/\d/).join('')
	          Diet.create(
	            :univ_id => 4,
	            :name => "창업보육센터",
	            :location => "창업보육센터 지하1층",
	            :date => @default_dates[i],
	            :time => time,
	            :diet => JSON.generate({:name => content, :price => price}),
	            :extra => ''
	            )
	        end
	      end
	      i += 1
	      #금요일까지 하고 끝
	      if (i == 5)
	        break
	      else
	      end
	    end

	    #마인드 푸드코트
	    hanyang_erica_url = "https://www.hanyang.ac.kr/upmu/sikdan/sikdan_View.jsp?gb=2&code=4"

	    hanyang_erica_data = Nokogiri::HTML(open(hanyang_erica_url))

	    #마인드 푸드코트
	    target = hanyang_erica_data.css('div#sikdang table')
	    content = ""
	    price = ""
	    i = 0

	    target.each do |t|
	      t.css('td').each do |part|
	        if (part.nil? || part.text == " ")
	          puts "nothing"
	        elsif (part.text == "한식")
	          content = part.text
	        elsif (part.text == "양식")
	          content = part.text
	        elsif (part.text == "분식")
	          content = part.text
	        elsif ((part.text.reverse[0..2] =~ /\A\d+\z/) == 0) #숫자로만 이루어져 있다면 마지막 세자리가 숫자라면
	          next
	        else
	          content_part = part.text
	          price = part.next.next.text.scan(/\d/).join('')
	          Diet.create(
	            :univ_id => 4,
	            :name => "마인드 푸드코트",
	            :location => "복지관 3층",
	            :date => @default_dates[i],
	            :time => 'breakfast',
	            :diet => JSON.generate({:name => content+content_part, :price => price}),
	            :extra => ''
	            )
	        end
	      end
	      i += 1
	      #금요일까지 하고 끝
	      if (i == 5)
	        break
	      else
	      end
	    end

	end

end