mixin UseValidation {
  bool isEmailValid = false;

  validateEmail(value) {
    isEmailValid = false;
    if (value?.isEmpty ?? true) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Check your Email';
    } else {
      isEmailValid = true;
      return null;
    }
  }

  requiredField(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  isValueExist(value) {
    return !(value == null || value.isEmpty);
  }
}
