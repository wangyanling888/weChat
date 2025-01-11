import { DefaultUserList, UserInfo } from '../module/users';
import { router } from '@kit.ArkUI';

@Entry
@Component
export struct ContactPage {
  @State message: string = 'Contact';
  @State
  @Watch("filterName")
  searchValue: string = ''
  @State
  listUser: UserInfo[] = []

  aboutToAppear(): void {
    this.listUser = DefaultUserList
  }

  filterName() {
    this.listUser = DefaultUserList.filter((userInfo: UserInfo) => {
      return userInfo.username.includes(this.searchValue)
    })
  }

  build() {
    Column() {
      Row() {
        Search({ placeholder: "搜索", value: $$this.searchValue }).borderRadius(4).height(30)
        //   .onSubmit((value: string) => {
        //   AlertDialog.show({ message: this.searchValue })
        //   this.searchValue = value
        // })
      }.width('100%').padding({ left: 10, right: 10 }).margin({ left: 10, right: 10 })


      List() {
        ForEach(this.listUser, (item: UserInfo) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar).borderRadius(20).width(30)
                .height(30)
              Column() {
                Text(item.username).fontSize(12)
              }.layoutWeight(1).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center)

            }.padding({ left: 10, right: 10 }).justifyContent(FlexAlign.Center)
          }.height(60).stateStyles({
            normal: {
              .backgroundColor($r("app.color.white"))
            },
            pressed: {
              .backgroundColor($r("app.color.back_color"))
            }
          }).onClick(() => {
            router.pushUrl({ url: 'pages/chatDetail/ChatDetailPage', params: item })
          })
        })
      }
      .margin({ left: 10, right: 10 })
      .divider({ strokeWidth: 1, color: $r("app.color.border_color") })
      .width('100%')
      .height("100%")
      .padding({ top: 10, bottom: 10 })
      .backgroundColor($r('app.color.white'))
      .listDirection(Axis.Vertical)
    }
    .height('100%')
    .width('100%')
  }
}