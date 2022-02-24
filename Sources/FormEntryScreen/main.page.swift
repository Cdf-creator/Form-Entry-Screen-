import ScadeKit
import ScadeUI

class InputItemInfo: EObject {
  let label2: String
  let keyboardType: SCDWidgetsKeyboardType

  init(label2: String, keyboardType: SCDWidgetsKeyboardType = .alphabetic) {
    self.label2 = label2
    self.keyboardType = keyboardType
  }
}

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    list1.elementProvider { (item: InputItemInfo, element) in
      (element["label2"] as? SCDWidgetsLabel)?.text = item.label2
      (element["textbox1"] as? SCDWidgetsTextbox)?.keyboardType = item.keyboardType
    }

    list1.items = [
      InputItemInfo(label2: "First Name"),
      InputItemInfo(label2: "Last Name"),
      InputItemInfo(label2: "Middle Name"),
      InputItemInfo(label2: "Email"),
      InputItemInfo(label2: "Occupation"),
      InputItemInfo(label2: "Company Name"),
      InputItemInfo(label2: "Phone Number", keyboardType: .number),
      InputItemInfo(label2: "Gender"),
      InputItemInfo(label2: "Country"),
      InputItemInfo(label2: "Address"),
      InputItemInfo(label2: "Street Number", keyboardType: .number),
      InputItemInfo(label2: "Street Name"),
      InputItemInfo(label2: "Zip Code", keyboardType: .number),
      InputItemInfo(label2: "City"),
      InputItemInfo(label2: "State"),
    ]

  }
}
