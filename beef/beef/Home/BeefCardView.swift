
import SwiftUI
import SDWebImageSwiftUI

struct BeefCardView: View {
    var viewModel: BeefViewModel
//    @Binding var selected: BeefViewModel?
    var selection: ((_ vm: BeefViewModel) -> ())
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
//            WebImage(url: viewModel.coverImage)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(maxWidth: .infinity)
            VStack {
                HStack {
                    Text(viewModel.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color("titleColor"))
                        .padding([.top, .leading], 16.0)
                    Spacer()
                }
                PointView(point: viewModel.points[0])
                PointView(point: viewModel.points[1])
                    Spacer()
            }
        }
        .frame(width: 343, height: 186)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
//        .shadow(color: Color(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
//        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//        .onTapGesture {
//            self.selection(self.viewModel)
////            self.show.toggle()
//        }
//        .edgesIgnoringSafeArea(.all)
    }
}

class BeefViewModel {
    let beef: Beef
    let title: String
    let description: String
    let coverImage: URL?
    let points: [Point]
    
    init(beef: Beef) {
        self.beef = beef
        self.title = beef.title
        self.description = beef.description
        self.coverImage = URL(string: beef.coverImageURL)
        self.points = [Point.sample1, Point.sample2]
    }
    
}
struct BeefCardView_Previews: PreviewProvider {
    static var previews: some View {
        BeefCardView(viewModel: BeefViewModel(beef: Beef.sample)) {
            print($0)
        }
    }
}
