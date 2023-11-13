mixin UseForm {
  prepareData(Map<String, Map<String, dynamic>> formData) {
    var data = {};
    for (var key in formData.keys) {
      data[key] = formData[key]?['value'];
    }
    return data;
  }

  resetForm(Map<String, Map<String, dynamic>> formData) {
    for (var key in formData.keys) {
      formData[key]?['value'] = '';
      formData[key]?['isValid'] = false;
    }
    return formData;
  }

  bool checkFormValidity(Map<String, Map<String, dynamic>> formData) {
    var isValid = true;
    for (var value in formData.values) {
      if (value['isValid'] != true) {
        isValid = false;
      }
    }
    return isValid;
  }
}
