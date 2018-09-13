class Counter{
	private var value=0
	def increment(){ value+=1}
	def current(): Int={value}
}
object MyCounter{
	def main(args:Array[String]){
		val myCounter=new Counter
		myCounter.increment
		println(myCounter.current) 
	}
}
