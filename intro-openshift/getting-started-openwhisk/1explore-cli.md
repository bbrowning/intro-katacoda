The Apache OpenWhisk CLI is accessed using the command _wsk_. From here, you can list, invoke, and deploy new actions.

## Task 1

Let's get started by examining the built-in packages and actions

`wsk package list /whisk.system`{{execute}}

`wsk package get --summary /whisk.system/utils`{{execute}}

## Task 2

Now let's invoke the built-in echo action, testing blocking and
non-blocking invocations.

`wsk action invoke /whisk.system/utils/echo --blocking --param message test`{{execute}}

`wsk action invoke /whisk.system/utils/echo --result --param message test`{{execute}}

`wsk action invoke /whisk.system/utils/echo --param message test`{{execute}}

`wsk activation get --last`{{execute}}

