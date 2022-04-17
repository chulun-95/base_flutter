extension NullEmptyCheck on String? {
  bool get isNotNullAndEmpty {
    if (this != null && this?.isNotEmpty == true) {
      return true;
    }

    return false;
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}