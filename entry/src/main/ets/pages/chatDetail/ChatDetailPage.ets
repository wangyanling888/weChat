import { UserInfo } from '../../module/users';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct ChatDetailPage {
  @State message: string = 'Hello World';
  @State userInfo: UserInfo = {} as UserInfo;
  @State showVoice: boolean = false;

  aboutToAppear(): void {
    this.userInfo = router.getParams() as UserInfo
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Start }) {
        Text("dsdfdf")
          .fontColor($r("app.color.black"))
          .fontSize(12)
          .width('100%')
          .textAlign(TextAlign.Center)
        Image($r("app.media.ic_public_arrow_left")).width(20).height(20).onClick(() => {
          router.back()
        })
      }.width('100%')

      Blank()

      Row({ space: 10 }) {
        Image(this.showVoice ? $r("app.media.ic_public_sound") : $r("app.media.ic_public_keyboard"))
          .width(20)
          .height(20)
          .onClick(() => {
            this.showVoice = !this.showVoice
          })
        if (this.showVoice) {
          Button("按住  说话")
            .backgroundColor($r("app.color.white"))
            .height(35)
            .layoutWeight(1)
            .borderRadius(2)
            .fontColor($r("app.color.text_primary"))
        } else {
          TextInput({ placeholder: '请输入' }).backgroundColor($r('app.color.white')).layoutWeight(1)
        }

        Image($r("app.media.ic_public_add_norm")).width(20).height(20)
      }
      .width('100%')
      .height(60)
      .backgroundColor($r("app.color.bottom_color"))
      .alignItems(VerticalAlign.Bottom)
      .alignItems(VerticalAlign.Center)
      .borderRadius(20)
      .margin({ left: 10, right: 10 })
      .padding({ left: 10, right: 10 })
    }
    .height('100%')
    .width('100%')
  }
}