#include "TestEnum.h"
#include "PEG/test.peg.h"
#include <QtTest/QtTest>

void TestEnum::enumValue()
{
    COLOR::Enum color = COLOR::RED;
    QVERIFY(color == COLOR::RED);
}

void TestEnum::forEachEnumValue()
{
    unsigned int count = 0;
    COLOR::info().forEachEnumValue([&count](const QtnEnumValueInfo& value)->bool {
        ++count;
        return true;
    });
    QVERIFY(count == COLOR::values_count);
}

void TestEnum::find()
{
    QVERIFY(COLOR::info().findByValue(COLOR::RED));
    QVERIFY(!COLOR::info().findByValue(333));
    QVERIFY(COLOR::info().findByName("Blue"));
    QVERIFY(!COLOR::info().findByName("Brown"));
}

void TestEnum::state()
{
    QVERIFY(COLOR::info().findByValue(COLOR::RED)->state() == QtnEnumValueStateNone);
    QVERIFY(COLOR::info().findByValue(COLOR::BLUE)->state() == (QtnEnumValueStateHidden | QtnEnumValueStateObsolete));
}
