class Counter{
	private var value=0
	def increment(step: Int) :Unit={ value+= step}
	def current():Int={value}
}
object MyCounter{
	def main(args:Array[String]){
		val myCounter=new Counter
		myCounter.increment(5)
		println(myCounter.current)
	}
}
