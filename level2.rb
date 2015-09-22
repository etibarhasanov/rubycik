#Push test
def calc expression
	#puts expression
  # evaluate `expression` and return result
  #puts m = expression.scan(/([(][^()]+[)])/) #([(]d+[+-/*]d+)
  



  exp2=/[(]([^()]+)[)]/
while (expression=~exp2)!=nil  do
  val=twoValCalc(exp2.match(expression))
  expression.sub!(exp2,val.to_s)
end

exp2=/([-]{2}\d+[.]?\d*)/
  	if(expression=~exp2) 
  	 val=minusMult(exp2.match(expression))
  	  expression.gsub!(exp2,val.to_s)
  	end
#*/
  exp2=/([-]?\d+[.]?\d*\s*[\/*]\s*[-]?\d+[.]?\d*)/
   while (expression=~exp2)!=nil  do
   val=twoValCalc(exp2.match(expression))
   expression.sub!(exp2,val.to_s)
  end

  #+-
 #\d+[.]?\d*\s*[+-]\s*[-]?\d+[.]?\d*
	exp2=/([-]?\d+[.]?\d*\s*[+-]\s*[-]?\d+[.]?\d*)/
   while (expression=~exp2)!=nil  do
   val=twoValCalc(exp2.match(expression))
    expression.sub!(exp2,val.to_s)
  end
return expression.to_f

 end

 def minusMult expression
 	 factors=expression[1].split('-',2)
   	return factors[1].to_f.send('*',-1)
 end

def twoValCalc expression
	# "1 "<<expression[1]

	["/", '*', '+', '-'].each do |op|
 		if expression[1].include? op
      		factors= expression[1].split(op,2)
      		#puts factors[0]
      		#puts factors[1]
      		#puts op
   			valreturn=factors[0].to_f.send(op,factors[1].to_f)
   			return valreturn
    	end
	end
	return expression[1]
end

puts calc('1+1');
puts calc('1 - 1');
puts calc('1* 1');
puts calc('1 /1');
puts calc('-123');
puts calc('123');
puts calc('2 /2+3 * 4.75- -6');
puts calc('12* 123');
puts calc('2 / (2 + 3) * 4.33 - -6');
puts calc('12* 123/-(-5 + 2)')
puts calc('123/-(-5 + 2)')
puts calc('-5 + 2')
puts calc('-5 + -2')



