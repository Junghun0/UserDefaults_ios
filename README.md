# UserDefaults_ios

### UserDefaults 란?

- iOS 앱 실행 과정에서 저장해야 할 데이터가 비교적 단순한 구조라면 기본 저장소에 저장하기 위해 제공하는 객체

- UserDefaults는 런타임 환경에서 동작하는 객체이다. 앱이 실행되는 동안 기본저장소에 접근하여 데이터를 가져오고 기록하는 역할

- UserDefaults는 싱글톤 패턴으로 설계되어 있어 앱 전체에서 딱 하나의 인스턴스만 생성됨-> 앱 전체가 공유해서 사용하는 형태

- UserDefaults 객체를 호출하면 각각의 호출에 응답하기 위한 인스턴스가 생성되는 것이 아니라 하나의 UserDefaults 객체가 모든 요청을 받아 처리

- 사용시 직접 초기화 메소드를 호출하여 인스턴스를 생성하지 않고, 이미 생성되어 있는 인스턴스를 참조해서 사용해야 함 -> UserDefaults 객체의 메소드나 프로퍼티 대부분은 
클래스 메소드나 클래스 프로퍼티로 정의되어 있다.

#### 소스코드

- 데이터 저장 할때

```swift
  let plist = UserDefaults.standard
  //저장된 값을 꺼내어 각 컨트롤에 설정한다.
  self.name.text = plist.string(forKey: "name")
  self.married.isOn = plist.bool(forKey: "married")
  self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
```

- 데이터 불러 올때

```swift
@IBAction func changeGender(_ sender: UISegmentedControl) {
     let value = sender.selectedSegmentIndex // 0남자 1여자
        
     let plist = UserDefaults.standard// 기본 저장소 객체를 가져옴
     plist.set(value, forKey: "gender")//"gender" 키값으로 저장
     plist.synchronize()//동기화처리
}
```


