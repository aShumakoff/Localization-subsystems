

////////////////////////////////////////////////////////////////////////////////
// <Заголовок модуля: краткое описание и условия применения модуля.>
//  
////////////////////////////////////////////////////////////////////////////////
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(ЗначениеКонстанты, "Константа",
		Объект.Ссылка, , , Истина);
	НастроитьЭлементыДляРежимаПароля();
		Если ЗначениеЗаполнено(Объект.Идентификатор) Тогда
		
		УстановитьПривилегированныйРежим(Истина);
		Пароль = ОбщегоНазначения.ПрочитатьДанныеИзБезопасногоХранилища(Объект.Идентификатор,"Пароль"); 
		УстановитьПривилегированныйРежим(Ложь);
		Если Пароль <> Неопределено Тогда
			
			Пароль = ?(ЗначениеЗаполнено(Пароль), ЭтотОбъект.УникальныйИдентификатор, "");
			
		КонецЕсли;
		
	КонецЕсли;
КонецПроцедуры



&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ПарольИзменен Тогда
  УстановитьПривилегированныйРежим(Истина);
  ОбщегоНазначения.ЗаписатьДанныеВБезопасноеХранилище(ТекущийОбъект.Идентификатор, Пароль);
  УстановитьПривилегированныйРежим(Ложь);
  Пароль = ?(ЗначениеЗаполнено(Пароль), ЭтотОбъект.УникальныйИдентификатор, "");
  ПарольИзменен = Ложь;
 КонецЕсли;
КонецПроцедуры


&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(ЗначениеКонстанты, "Константа",
		Объект.Ссылка, , , Истина);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы
&НаКлиенте
Процедура ПарольПриИзменении(Элемент)
	ПарольИзменен = Истина;
КонецПроцедуры

&НаКлиенте
Процедура ЭтоПарольПриИзменении(Элемент)
	НастроитьЭлементыДляРежимаПароля();
КонецПроцедуры
#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_Значения

#КонецОбласти

#Область ОбработчикиКомандФормы

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура НастроитьЭлементыДляРежимаПароля()
	ВидимостьДоступность = Не Объект.ЭтоПароль;
	ОбщегоНазначенияклиентСервер.УстановитьСвойствоЭлементаФормы(Элементы, "ГруппаЗначения", "Видимость",
		ВидимостьДоступность);
	ОбщегоНазначенияклиентСервер.УстановитьСвойствоЭлементаФормы(Элементы, "ТипЗначения", "Видимость",
		ВидимостьДоступность);
	ОбщегоНазначенияклиентСервер.УстановитьСвойствоЭлементаФормы(Элементы, "Логин", "Видимость",
		Не ВидимостьДоступность);
	ОбщегоНазначенияклиентСервер.УстановитьСвойствоЭлементаФормы(Элементы, "Пароль", "Видимость",
		Не ВидимостьДоступность);

КонецПроцедуры
#КонецОбласти