#Push test
def calc expression
	#puts expression
  # evaluate `expression` and return result
  #puts m = expression.scan(/([(][^()]+[)])/) #([(]d+[+-/*]d+)
  val=twoValCalc(/[(]([^()]+)[)]/.match(expression))
  expression.gsub!(/([(][^()]+[)])/,val.to_s)

  
 end

def twoValCalc expression
	puts expression[1]
	["/", '*', '-', '+'].each do |op|
 		if expression[1].include? op
      	factors= expression[1].split(op)
   		return factors[0].to_f.send(op,factors[1].to_f)
    	end
	end
	return 0
end


 puts calc('2 / (2 + 3) * 4.33 - -6')


<<-DOC
 ["/", '*', '-', '+'].each do |op|
 	puts op
 	if expression.exist
      factors= expression.split(op)
      return summing(factors,'-')
    end
    if op.to_s=='+'
      factors= expression.split(op)
      return summing(factors,'+')
    end
    if op.to_s=='/'
      factors= expression.split(op)
      return summing(factors,'/')
    end
    if op.to_s=='*'
      factors= expression.split(op)
      return summing(factors,'*')
    end



def summing(factors,op) 
    return factors[0].to_f.send(op,factors[1].to_f)
end
=end


DOC
