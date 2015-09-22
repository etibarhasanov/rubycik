#Push test
def calc expression
	#puts expression
  # evaluate `expression` and return result
  #puts m = expression.scan(/([(][^()]+[)])/) #([(]d+[+-/*]d+)
  


exp2=/([-]{2}\d+[.]?\d*)/
  	if(expression=~exp2) 
  	 val=minusMult(exp2.match(expression))
  	  expression.gsub!(exp2,val.to_s)
  	end

  exp2=/[(]([^()]+)[)]/
while (expression=~exp2)!=nil  do
  val=twoValCalc(exp2.match(expression))
  expression.sub!(exp2,val.to_s)
end
#*/
  exp2=/(\d+[.]?\d*\s*[\/*]\s*[-]?\d+[.]?\d*)/
   while (expression=~exp2)!=nil  do
   val=twoValCalc(exp2.match(expression))
   expression.sub!(exp2,val.to_s)
  end

  #+-
 #\d+[.]?\d*\s*[+-]\s*[-]?\d+[.]?\d*
	exp2=/(\d+[.]?\d*\s*[+-]\s*[-]?\d+[.]?\d*)/
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
	#puts "1 "<<expression[1]

	["/", '*', '-', '+'].each do |op|
		#puts "op"<<op.to_s
		#puts expression[1]
 		if expression[1].include? op
      		factors= expression[1].split(op,2)
   			valreturn=factors[0].to_f.send(op,factors[1].to_f)
   			return valreturn
    	end
	end
	return 0
end

puts calc('1476.0/--5.0')


