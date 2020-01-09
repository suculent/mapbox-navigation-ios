import UIKit
import MapboxDirections

extension VisualInstruction.Component {
    static let scale = UIScreen.main.scale
    
    var cacheKey: String? {
        switch self {
        case let .exit(representation), let .exitCode(representation):
            let exitCode = representation.text
            return "exit-" + exitCode + "-\(VisualInstruction.Component.scale)"
        case let .image(representation):
            guard let imageURL = representation.image.imageBaseURL else {
                return "generic-" + representation.alternativeText.text
            }
            
            return "\(imageURL.absoluteString)-\(VisualInstruction.Component.scale)"
        case .text, .delimiter, .lane:
            return nil
        case .guidanceView(let guidanceViewRepresentation, let alternativeText):
            print("hello")
            guard let imageURL = guidanceViewRepresentation.imageURL else { return nil }
            return "guidance-" + imageURL.absoluteString
        }
    }
}
