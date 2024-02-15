@Entry
@Component
struct Index {
  @State displayTime: string = '00:00:10'

  build() {
    Row() {
      Column() {
        Text(this.displayTime).fontSize(40).fontColor(Color.White)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Black)
  }
}