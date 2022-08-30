import Foundation
import Firebase
import FirebaseCore
import FirebaseDatabaseSwift
import FirebaseDatabase
import FirebaseAuth
import Alamofire
import RxSwift
import RxCocoa

class UserApi {
    var usr = Dictionary<String,String>()
    var usrobs = BehaviorRelay<Dictionary<String,String>>(value: [:])
    func signUp(email: String ,password: String,phone: String,name: String,lastname: String,address: String,gender: String,birthday: String) -> Bool
    {
        var signinreturn : Bool = false
        Auth.auth().createUser(withEmail: email, password: password){
            (AuthDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                signinreturn = false
                print("-----")
                print(signinreturn)
                return
            }
        if let authData = AuthDataResult {
                print(authData.user.email!)
            print(authData.user.uid)
                let dict: Dictionary<String,Any> = [
                    "uid" :authData.user.uid,
                    "name" :name,
                    "lastname" :lastname,
                    "email" :email,
                    "birthday" :birthday,
                    "gender" :gender,
                    "adress" :address,
                    "phone" :phone,
                ]
            print(dict)
            Database.database().reference().child("users").child(authData.user.uid).setValue(dict, withCompletionBlock: {
                    (error, ref) in
                     if error != nil {
                        print(error?.localizedDescription)
                        signinreturn = false
                     }
                     else {
                        print("-----------")
                        print("***********")
                        signinreturn = true
                        print(signinreturn)
                     }
                })
            }
        }
        return signinreturn
    }
    func SignIn(email :String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult,error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            print(authResult?.user.email)
            onSuccess()
        }
    }
    func Logout(){do { try Auth.auth().signOut() }
    catch { print("already logged out") }}

    func getUserInformation(onSuccess: @escaping() -> Void){
        var userData = Dictionary<String, String>()
        let rootRef = Database.database ().reference ()
        let ref = rootRef.child("users").child (Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
           let userDict = snapshot.value as! [String: Any]
            let userEmail = userDict["email"] as! String
            let userName = userDict["name"] as! String
            let userLastname = userDict["lastname"] as! String
            let userBirthday = userDict["birthday"] as! String
            let userGender = userDict["gender"] as! String
            let userAdress = userDict["adress"] as! String
            let userPhone = userDict["phone"] as! String
            userData["email"] = userEmail
            userData["name"] = userName
            userData["lastname"] = userLastname
            userData["phoneNumber"] = userPhone
            userData["birthday"] = userBirthday
            userData["gender"] = userGender
            userData["adress"] = userAdress
            print(userData)
            UserInformation.usrInfo = userData
            if(UserInformation.usrInfo != nil){
                onSuccess()
                print("success")
            }
            print("-----*******")
        })
    }
    func isUserLoggedIn() -> Bool {
        print("-------------------------------")
        print(UserInformation.defaults)
        print("________________________________")
      /*  if(Auth.auth().currentUser != nil){
            return true
        }else
        {
            return false
        }*/
        return false
    }
    func setUserDefaultInformation(onSuccess: @escaping() -> Void){
        var userData = Dictionary<String, String>()
        let rootRef = Database.database ().reference ()
        _ = rootRef.child("users").child (Auth.auth().currentUser!.uid) .observeSingleEvent(of: .value, with: { (snapshot) in
           let userDict = snapshot.value as! [String: Any]
            let userEmail = userDict["email"] as! String
            let userName = userDict["name"] as! String
            let userLastname = userDict["lastname"] as! String
            let userBirthday = userDict["birthday"] as! String
            let userGender = userDict["gender"] as! String
            let userAdress = userDict["adress"] as! String
            let userPhone = userDict["phone"] as! String
            userData["email"] = userEmail
            userData["name"] = userName
            userData["lastname"] = userLastname
            userData["phoneNumber"] = userPhone
            userData["birthday"] = userBirthday
            userData["gender"] = userGender
            userData["adress"] = userAdress
            print(userData)
            UserInformation.usrInfo = userData
            if(UserInformation.usrInfo != nil){
                onSuccess()
                print("success")
                UserInformation.defaults.set(userEmail, forKey: "email")
                UserInformation.defaults.set(userName, forKey: "name")
                UserInformation.defaults.set(userLastname, forKey: "lastName")
                UserInformation.defaults.set(userPhone, forKey: "phoneNumber")
                UserInformation.defaults.set(userBirthday, forKey: "birthDay")
                UserInformation.defaults.set(userGender, forKey: "gender")
                UserInformation.defaults.set(userAdress, forKey: "adress")
            }
            print("-----*******")
        })
    }
}
