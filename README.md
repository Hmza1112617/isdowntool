
# IsDownTool

أداة بسيطة بلغة Bash تتحقق من حالة أي موقع إلكتروني (إذا كان شغال أو لا)  
تعتمد على موقع [IsItDownRightNow](https://www.isitdownrightnow.com) وتحلل النتيجة عبر API خاص.

## رابط المشروع

[GitHub - isdowntool](https://github.com/Hmza1112617/isdowntool.git)

## المتطلبات

```
pkg install curl
pkg install jq
```
## طريقة تنزيل

```
git clone https://github.com/Hmza1112617/isdowntool.git
cd isdowntool
bash isdown.sh
```
رح تظهرلك رسالة تطلب منك تدخل اسم الدومين، مثل:

Enter website domain (like chess.com):

بعدها راح تفحص الأداة الموقع وتعطيك النتيجة إذا هو شغال أو داون.

مثال على النتيجة

======================
  Is Down? Tool
======================

Enter website domain (like chess.com): google.com

Checking google.com...

Result:
.......


ملاحظات

السكربت يستخدم "isitdownrightnow"
ويستخدم api chat gpt لتحليل نتيجة
