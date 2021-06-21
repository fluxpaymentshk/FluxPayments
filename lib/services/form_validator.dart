class FormValidator {
  String? validatePassword(String val) {
    if (val.length <= 8) {
      return "Please enter password of length greater than 8";
    }
    if (val.length > 24) {
      return "Please enter password of length less than 24";
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    bool r = regExp.hasMatch(val);
    if (r == false) {
      return "Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character\nCommon Allow Character ( ! @ # \$ & * ~ )";
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return "Passwords dont match";
    }
    return null;
  }

  String? validateEmail(String email) {
    if (email.length == 0) {
      return "Please enter some value";
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "Invalid email";
    }
    return null;
  }

   String? validateField(String s) {
    if (s.length == 0) {
      return "Please enter some value";
    }
    return null;
  }
}
