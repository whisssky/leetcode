class Demo4{
	Boolean a1 = false;
	int a2 = 3;
	void m1(Boolean a){
		if(a == true)
			a1 = false;

	}

	void m2(){
		int i=10;
		while(i!=0)
		{
			i = i - 1;
		}
	}
	public static void main(String[] args)
	{
		Demo4 d = new Demo4();
		d.m1(true);
		d.m2();

			}
}