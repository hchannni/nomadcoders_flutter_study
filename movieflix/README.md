# movieflix

Nomad Coders 플러터 스터디 4기 중 **🔥플러터 챌린지🔥** 졸업작품입니다.

## Simulation Video

[Video Link](https://imgur.com/a/hvOFaHT)

<video controls>
  <source src="chan_movieflix.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

## Explanatnion

### 1. Data Model (`/models`)

- 전체 영화 리스트를 받는 `MovieModel` class
- 한 영화의 세부정보를 받는 `MovieDetailModel` class

### 2. API Service (`/services`)

- Flutter의 _http_ 패키지 활용
- `Future` 타입 & _async-await_ 기능 활용

### 3. Widgets (`/widgets`)

코드 리팩토링 과정에서 반복되는 코드들을 각 위젯으로 분리

- `HeadingText` widget: 홈 화면의 영화 리스트 제목 텍스트
- `FutureBuilder<List<MovieModel>> homeScreenFutureBuilder` 함수: FutureBuilder와 builder 함수
- `MoviePosterPopular` widget: 인기 영화를 위한 크기가 큰 위젯
- `MoviePosterSmall` widget: 현재 상영중, 개봉 예정 영화를 위한 크기가 작고 제목 텍스트가 있는 위젯  
  두 Movie Poster 위젯은 `GestureDetector` 와 `Navigator` 위젯을 활용해 클릭했을 시 DetailScreen으로 화면을 이동하는 애니메이션을 구현했습니다.

### 4. Screens (`/screens`)

- `HomeScreen`: 홈 화면 위젯, `ApiService`의 함수 호출, `Future` 값을 받아서 `FutureBuilder`를 활용해 화면을 그린다.
- `DetailScreen`: 홈 화면에서 `Navigator`를 통해 각 영화의 세부정보 스크린으로 이동.
