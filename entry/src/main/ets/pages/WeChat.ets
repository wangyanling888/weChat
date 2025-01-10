@Entry
@Component
 export struct WeChat {
  @State message: string = 'wechat';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('WeChatHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}