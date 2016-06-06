#삼육대학교
class SYU
	def initialize
		@default_dates = Array.new
	end
	def scrape

	    syu_url = "http://www.syu.ac.kr/web/kor/life_d_03_02_b"

	    syu_data = Nokogiri::HTML(open(syu_url))

	    #From mon to Fri
	    i = 0
	    (0..4).each do |i|
	    	@default_dates << ((Date.parse Date.today.to_s) + i).to_s
	    end

	    #프랜들리
	    target = syu_data.css('table.table-a tbody td')
	    name = ""
	    price = ""
	    check = 0
	    i = 0
	    @default_dates.each do |dat|
	      target.each do |t|
	        if check == 0
	          name = t.text
	          check = 1
	        else
	          price = t.text
	          Diet.create(
	            :univ_id => 7,
	            :name => "프랜들리",
	            :location => "바율관1층",
	            :date => dat,
	            :time => 'breakfast',
	            :diet => JSON.generate({:name => name, :price => price}),
	            :extra => ''
	            )
	          check = 0
	        end
	      end
	    end

	    #파인하우스
	    pinehouse = Array.new
	    pinehouse << JSON.generate({:name => "비빔밥", :price => "2700"})
	    pinehouse << JSON.generate({:name => "비빔밥(잡곡)", :price => "3200"})
	    pinehouse << JSON.generate({:name => "돌솥비빔밥", :price => "2700"})
	    pinehouse << JSON.generate({:name => "돌솥비빔밥(잡곡)", :price => "3500"})
	    pinehouse << JSON.generate({:name => "치즈돌솥비빔밥", :price => "3200"})
	    pinehouse << JSON.generate({:name => "청국장", :price => "3000"})
	    pinehouse << JSON.generate({:name => "육개장", :price => "2700"})
	    pinehouse << JSON.generate({:name => "찌개(된장/순두부/콩비지/김치)", :price => "2700"})
	    pinehouse << JSON.generate({:name => "부대찌개", :price => "3000"})
	    pinehouse << JSON.generate({:name => "김치덮밥", :price => "2700"})
	    pinehouse << JSON.generate({:name => "덮밥(잡채/마파두부/버섯)", :price => "3200"})
	    pinehouse << JSON.generate({:name => "들깨순두부", :price => "3000"})
	    pinehouse << JSON.generate({:name => "공기밥", :price => "500"})
	    pinehouse << JSON.generate({:name => "현미밥", :price => "1000"})
	    pinehouse << JSON.generate({:name => "버섯두부전골", :price => "10000"})
	    pinehouse << JSON.generate({:name => "만두전공", :price => "10000"})
	    pinehouse << JSON.generate({:name => "김치주먹밥", :price => "1300"})
	    pinehouse << JSON.generate({:name => "샌드위치(사과/야채)", :price => "1500"})
	    pinehouse << JSON.generate({:name => "베지버거", :price => "2000"})
	    pinehouse << JSON.generate({:name => "야채김밥", :price => "1700"})
	    pinehouse << JSON.generate({:name => "치즈김밥/구프랑김밥", :price => "2000"})
	    pinehouse << JSON.generate({:name => "떡만두국", :price => "3000"})
	    pinehouse << JSON.generate({:name => "라면", :price => "1700"})
	    pinehouse << JSON.generate({:name => "치즈라면/만두라면", :price => "2000"})
	    pinehouse << JSON.generate({:name => "김치떡라면", :price => "2000"})
	    pinehouse << JSON.generate({:name => "채식라면", :price => "2300"})
	    pinehouse << JSON.generate({:name => "잔치국수/칼국수", :price => "2500"})
	    pinehouse << JSON.generate({:name => "토마토스파게티", :price => "3000"})
	    pinehouse << JSON.generate({:name => "수제비", :price => "2300"})
	    pinehouse << JSON.generate({:name => "들깨수제비", :price => "2800"})
	    pinehouse << JSON.generate({:name => "칼국수(들깨/만두/버섯)", :price => "3000"})
	    pinehouse << JSON.generate({:name => "떡볶이", :price => "2500"})
	    pinehouse << JSON.generate({:name => "부대떡볶이", :price => "5000"})
	    pinehouse << JSON.generate({:name => "치즈떡볶이", :price => "6000"})
	    pinehouse << JSON.generate({:name => "유부초밥", :price => "2500"})
	    pinehouse << JSON.generate({:name => "우동", :price => "1800"})
	    pinehouse << JSON.generate({:name => "우동(곱)", :price => "2300"})
	    pinehouse << JSON.generate({:name => "짜장면", :price => "2300"})
	    pinehouse << JSON.generate({:name => "짜장면(곱)", :price => "2800"})
	    pinehouse << JSON.generate({:name => "짬뽕", :price => "2500"})
	    pinehouse << JSON.generate({:name => "쩜뽕(곱)", :price => "3000"})
	    pinehouse << JSON.generate({:name => "간짜장", :price => "3000"})
	    pinehouse << JSON.generate({:name => "간짜장(곱)", :price => "3500"})
	    pinehouse << JSON.generate({:name => "볶음밥", :price => "2700"})
	    pinehouse << JSON.generate({:name => "쟁반짜장", :price => "6000"})
	    pinehouse << JSON.generate({:name => "쟁반짬뽕", :price => "7000"})
	    pinehouse << JSON.generate({:name => "쟁반쫄면", :price => "6500"})
	    pinehouse << JSON.generate({:name => "버섯탕수육(2인기준)", :price => "8000"})
	    pinehouse << JSON.generate({:name => "냉면", :price => "2500"})
	    pinehouse << JSON.generate({:name => "냉면(곱)", :price => "3000"})
	    pinehouse << JSON.generate({:name => "냉모밀(2인기준)", :price => "5000"})

	    @default_dates.each do |dat|
	      pinehouse.each do |p|
	        Diet.create(
	              :univ_id => 7,
	              :name => "파인하우스",
	              :location => "학생회관1층",
	              :date => dat,
	              :time => 'breakfast',
	              :diet => p,
	              :extra => ''
	              )
	      end
	    end

	end

end