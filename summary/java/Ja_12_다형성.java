package j0122;

public class ja0122_03 {

	public static void main(String[] args) {
		// text,caption()
		CaptionTv c = new CaptionTv();
		c.text = "[뮤직비디오] 로제-APT";
		System.out.println("자막 : "+c.text);
		//power,channel,power(),channelUp(), channelDown()
		c.Caption();
		Tv t = new Tv();
//		t.text = "자막기능이 없음."
		Tv t2 = new Tv();
//		t2.caption();
		
//		CaptionTv c2 = new Tv(); // 자손의 참조변수 = 부모 객체 는 안됨
		Tv t3 = new CaptionTv(); // 부모의 참조변수 = 자손 객체 는 가능(공간은 있지만 사용은 불가)
		CaptionTv c3;
		c3 = (CaptionTv)t3; // 형변환을 하면 공간을 사용할 수 있음(자손 > 부모 : 형변환 생략 / 부모 > 자손 : 형변환 작성)
		c3.text = "aaa";
		t = c3;
		System.out.println(c3.text);
		
		//에러
//		c3 = (CaptionTv)t2;
//		c3.text = "bbb";
		
		
// 다형성 : 부모의 참조변수로 자손의 객체를 다룰 수 있지만 역은 안됨


// ---------------------
// 부모 클래스 타입의 참조 변수는 부모 클래스에 정의된 메서드만 호출할 수 있습니다.

// 참조된 객체가 실제로 자식 클래스의 인스턴스일 경우, 해당 자식 클래스의 재정의된 메서드가 호출됩니다.

// 자식 클래스에만 존재하는 메서드를 호출하려면, 형변환(casting)을 사용해야 합니다.

// TV t1 = new CaptionTV();
// >> 부모의 참조변수로 자손의 객체를 다루는 것
// >> t1은 TV 타입이므로 CaptionTV(자식)에만 있는 메소드, 변수 호출 불가
//        >> TV에서 CaptionTV의 메소드를 실행하려면 행변환이 필요함

// >> TV(부모)와 CaptionTV(자식)에 같은 메소드가 있으면 CaptionTV(자식) 메소드를 먼저 실행
// >> TV(부모)에만 있는 메소드는 TV(부모)의 메소드 실행

// >> 자식(CaptionTV)에서 부모(TV)로 형 변환시 타입 생략 가능
// >> 부모(TV)에서 자식(CaptionTV)로 형 변환시 타입 생략 불가	
	}

}
