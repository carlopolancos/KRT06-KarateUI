function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env,
        myVarName: 'someValue'
    }

  // Add this at the top of your function to get the thread ID
    var threadName = java.lang.Thread.currentThread().getName();
    var userDataDir = 'target/chrome-perf-' + threadName;

    karate.configure('driver', {
      type: 'chrome',
      showDriverLog: true,
      addOptions: [
        "--remote-allow-origins=*",
        "--user-data-dir=" + userDataDir, // Give every thread its own "brain"
        "--incognito"                     // Prevents session bleeding
      ],
      startTimeout: 20000, // Increased to 20s to prevent the "connection refused" loop
      headless: false,
      screenshotOnFailure: true
    });

    return config;
}