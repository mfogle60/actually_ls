
# Steps to debugging:
# 1) Reproduce the error
# Developers need to be able to reproduce the bug. We need a deterministic
# way to consistently reproduce the problem, only then can you isolate the root
# cause.
# reproducing the error will often be more than half the battle.

# 2) Determine the boundaries of the error
# Once we can reproduce the error, it's time to tweak the data that caused the
#bug. (Play around with the data where we think problem is at.)
# We need to understand the scope of the error and determine the boundaries
# of the problem.
# play around with the data that is causing the error to determine its scope.
# Most problems can be solved in many ways, and the deeper you understand the
# problem, the more holistic your solution will be.

# 3) Trace the code
# Once we understand the boundaries of the error, it's time to trace the code.
# Go to the beginning of the program and see where the problem lies so we can
# trap it

# 4) Understand the problem well
# Now that we know where the problem lies, we can dissect whereever it is
# to better understand it

# 5) Implement a fix
# Spot the error and fix it
# Remember to resist the urge to fix more than one problem at a time,
# It is tempting to think of all the edge cases of the error, but remember to
# only solve one problem at a time

# 6) Test the fix
# Finally, after implementing a fix, make sure to verify that the code fixed the
# problem by using a similar set of tests from step #2
# After you learn about automated testing, you'll want to add an additional
# automated test to prevent regression. For now, you can test manually.
