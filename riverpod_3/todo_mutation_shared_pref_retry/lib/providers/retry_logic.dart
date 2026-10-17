Duration? myRetryLogic(int retryCount, Object error) {
  print('🔁Retry count: $retryCount');

  if (retryCount >= 5) {
    print('🔁Max retries reached!');
    return null;
  }

  return Duration(milliseconds: 100 * (1 << retryCount));
}
