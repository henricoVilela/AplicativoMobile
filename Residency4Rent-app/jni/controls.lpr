{hint: save all files to location: C:\Android\workspace\Residency4Rent\jni\ }
library controls;  //[by LAMW: Lazarus Android Module Wizard: 08/01/2019 13:42:46]
  
{$mode delphi}
  
uses
  Classes, SysUtils, And_jni, And_jni_Bridge, AndroidWidget, Laz_And_Controls,
  Laz_And_Controls_Events, unit1, unit2loginlocador, unit3cadastro, unitcontrol,
  unit4listimovellocador, unit5registerimovel, unit6takephoto, unit7viewimoveis,
  unit8panelview, unit9viewdetailsimoveis, unit10viewimovellocador,
  unit11copycadastro, unit12checkvisit, unit13loginlocatario,
  unit14viewinteresse, unit15viewrequestimoveis, unit16viewavaliacoes;
  
{%region /fold 'LAMW generated code'}

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnCreate
  Signature: (Landroid/content/Context;Landroid/widget/RelativeLayout;Landroid/content/Intent;)V }
procedure pAppOnCreate(PEnv: PJNIEnv; this: JObject; context: JObject; 
  layout: JObject; intent: JObject); cdecl;
begin
  Java_Event_pAppOnCreate(PEnv, this, context, layout, intent); 
    AndroidModule1.Init(gApp);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnScreenStyle
  Signature: ()I }
function pAppOnScreenStyle(PEnv: PJNIEnv; this: JObject): JInt; cdecl;
begin
  Result:=Java_Event_pAppOnScreenStyle(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnNewIntent
  Signature: (Landroid/content/Intent;)V }
procedure pAppOnNewIntent(PEnv: PJNIEnv; this: JObject; intent: JObject); cdecl;
begin
  Java_Event_pAppOnNewIntent(PEnv, this, intent);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnDestroy
  Signature: ()V }
procedure pAppOnDestroy(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnDestroy(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnPause
  Signature: ()V }
procedure pAppOnPause(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnPause(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnRestart
  Signature: ()V }
procedure pAppOnRestart(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnRestart(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnResume
  Signature: ()V }
procedure pAppOnResume(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnResume(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnStart
  Signature: ()V }
procedure pAppOnStart(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnStart(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnStop
  Signature: ()V }
procedure pAppOnStop(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnStop(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnBackPressed
  Signature: ()V }
procedure pAppOnBackPressed(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnBackPressed(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnRotate
  Signature: (I)I }
function pAppOnRotate(PEnv: PJNIEnv; this: JObject; rotate: JInt): JInt; cdecl;
begin
  Result:=Java_Event_pAppOnRotate(PEnv, this, rotate);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnConfigurationChanged
  Signature: ()V }
procedure pAppOnConfigurationChanged(PEnv: PJNIEnv; this: JObject); cdecl;
begin
  Java_Event_pAppOnConfigurationChanged(PEnv, this);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnActivityResult
  Signature: (IILandroid/content/Intent;)V }
procedure pAppOnActivityResult(PEnv: PJNIEnv; this: JObject; requestCode: JInt; 
  resultCode: JInt; data: JObject); cdecl;
begin
  Java_Event_pAppOnActivityResult(PEnv, this, requestCode, resultCode, data);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnCreateOptionsMenu
  Signature: (Landroid/view/Menu;)V }
procedure pAppOnCreateOptionsMenu(PEnv: PJNIEnv; this: JObject; menu: JObject); 
  cdecl;
begin
  Java_Event_pAppOnCreateOptionsMenu(PEnv, this, menu);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnClickOptionMenuItem
  Signature: (Landroid/view/MenuItem;ILjava/lang/String;Z)V }
procedure pAppOnClickOptionMenuItem(PEnv: PJNIEnv; this: JObject; 
  menuItem: JObject; itemID: JInt; itemCaption: JString; checked: JBoolean); 
  cdecl;
begin
  Java_Event_pAppOnClickOptionMenuItem(PEnv, this, menuItem, itemID, 
    itemCaption, checked);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnPrepareOptionsMenu
  Signature: (Landroid/view/Menu;I)Z }
function pAppOnPrepareOptionsMenu(PEnv: PJNIEnv; this: JObject; menu: JObject; 
  menuSize: JInt): JBoolean; cdecl;
begin
  Result:=Java_Event_pAppOnPrepareOptionsMenu(PEnv, this, menu, menuSize);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnPrepareOptionsMenuItem
  Signature: (Landroid/view/Menu;Landroid/view/MenuItem;I)Z }
function pAppOnPrepareOptionsMenuItem(PEnv: PJNIEnv; this: JObject; 
  menu: JObject; menuItem: JObject; itemIndex: JInt): JBoolean; cdecl;
begin
  Result:=Java_Event_pAppOnPrepareOptionsMenuItem(PEnv, this, menu, menuItem, 
    itemIndex);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnCreateContextMenu
  Signature: (Landroid/view/ContextMenu;)V }
procedure pAppOnCreateContextMenu(PEnv: PJNIEnv; this: JObject; menu: JObject); 
  cdecl;
begin
  Java_Event_pAppOnCreateContextMenu(PEnv, this, menu);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnClickContextMenuItem
  Signature: (Landroid/view/MenuItem;ILjava/lang/String;Z)V }
procedure pAppOnClickContextMenuItem(PEnv: PJNIEnv; this: JObject; 
  menuItem: JObject; itemID: JInt; itemCaption: JString; checked: JBoolean); 
  cdecl;
begin
  Java_Event_pAppOnClickContextMenuItem(PEnv, this, menuItem, itemID, 
    itemCaption, checked);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnDraw
  Signature: (J)V }
procedure pOnDraw(PEnv: PJNIEnv; this: JObject; pasobj: JLong); cdecl;
begin
  Java_Event_pOnDraw(PEnv, this, TObject(pasobj));
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnTouch
  Signature: (JIIFFFF)V }
procedure pOnTouch(PEnv: PJNIEnv; this: JObject; pasobj: JLong; act: JInt; 
  cnt: JInt; x1: JFloat; y1: JFloat; x2: JFloat; y2: JFloat); cdecl;
begin
  Java_Event_pOnTouch(PEnv, this, TObject(pasobj), act, cnt, x1, y1, x2, y2);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnClickGeneric
  Signature: (JI)V }
procedure pOnClickGeneric(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  value: JInt); cdecl;
begin
  Java_Event_pOnClickGeneric(PEnv, this, TObject(pasobj), value);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnSpecialKeyDown
  Signature: (CILjava/lang/String;)Z }
function pAppOnSpecialKeyDown(PEnv: PJNIEnv; this: JObject; keyChar: JChar; 
  keyCode: JInt; keyCodeString: JString): JBoolean; cdecl;
begin
  Result:=Java_Event_pAppOnSpecialKeyDown(PEnv, this, keyChar, keyCode, 
    keyCodeString);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnClick
  Signature: (JI)V }
procedure pOnClick(PEnv: PJNIEnv; this: JObject; pasobj: JLong; value: JInt); 
  cdecl;
begin
  Java_Event_pOnClick(PEnv, this, TObject(pasobj), value);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnLongClick
  Signature: (JI)V }
procedure pOnLongClick(PEnv: PJNIEnv; this: JObject; pasobj: JLong; value: JInt
  ); cdecl;
begin
  Java_Event_pOnLongClick(PEnv, this, TObject(pasobj), value);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnChange
  Signature: (JLjava/lang/String;I)V }
procedure pOnChange(PEnv: PJNIEnv; this: JObject; pasobj: JLong; txt: JString; 
  count: JInt); cdecl;
begin
  Java_Event_pOnChange(PEnv, this, TObject(pasobj), txt, count);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnChanged
  Signature: (JLjava/lang/String;I)V }
procedure pOnChanged(PEnv: PJNIEnv; this: JObject; pasobj: JLong; txt: JString; 
  count: JInt); cdecl;
begin
  Java_Event_pOnChanged(PEnv, this, TObject(pasobj), txt, count);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnEnter
  Signature: (J)V }
procedure pOnEnter(PEnv: PJNIEnv; this: JObject; pasobj: JLong); cdecl;
begin
  Java_Event_pOnEnter(PEnv, this, TObject(pasobj));
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnClose
  Signature: (J)V }
procedure pOnClose(PEnv: PJNIEnv; this: JObject; pasobj: JLong); cdecl;
begin
  Java_Event_pOnClose(PEnv, this, TObject(pasobj));
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnViewClick
  Signature: (Landroid/view/View;I)V }
procedure pAppOnViewClick(PEnv: PJNIEnv; this: JObject; view: JObject; id: JInt
  ); cdecl;
begin
  Java_Event_pAppOnViewClick(PEnv, this, view, id);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnListItemClick
  Signature: (Landroid/widget/AdapterView;Landroid/view/View;II)V }
procedure pAppOnListItemClick(PEnv: PJNIEnv; this: JObject; adapter: JObject; 
  view: JObject; position: JInt; id: JInt); cdecl;
begin
  Java_Event_pAppOnListItemClick(PEnv, this, adapter, view, position, id);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnFlingGestureDetected
  Signature: (JI)V }
procedure pOnFlingGestureDetected(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  direction: JInt); cdecl;
begin
  Java_Event_pOnFlingGestureDetected(PEnv, this, TObject(pasobj), direction);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnPinchZoomGestureDetected
  Signature: (JFI)V }
procedure pOnPinchZoomGestureDetected(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; scaleFactor: JFloat; state: JInt); cdecl;
begin
  Java_Event_pOnPinchZoomGestureDetected(PEnv, this, TObject(pasobj), 
    scaleFactor, state);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnLostFocus
  Signature: (JLjava/lang/String;)V }
procedure pOnLostFocus(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  text: JString); cdecl;
begin
  Java_Event_pOnLostFocus(PEnv, this, TObject(pasobj), text);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnBeforeDispatchDraw
  Signature: (JLandroid/graphics/Canvas;I)V }
procedure pOnBeforeDispatchDraw(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  canvas: JObject; tag: JInt); cdecl;
begin
  Java_Event_pOnBeforeDispatchDraw(PEnv, this, TObject(pasobj), canvas, tag);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnAfterDispatchDraw
  Signature: (JLandroid/graphics/Canvas;I)V }
procedure pOnAfterDispatchDraw(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  canvas: JObject; tag: JInt); cdecl;
begin
  Java_Event_pOnAfterDispatchDraw(PEnv, this, TObject(pasobj), canvas, tag);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnLayouting
  Signature: (JZ)V }
procedure pOnLayouting(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  changed: JBoolean); cdecl;
begin
  Java_Event_pOnLayouting(PEnv, this, TObject(pasobj), changed);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pAppOnRequestPermissionResult
  Signature: (ILjava/lang/String;I)V }
procedure pAppOnRequestPermissionResult(PEnv: PJNIEnv; this: JObject; 
  requestCode: JInt; permission: JString; grantResult: JInt); cdecl;
begin
  Java_Event_pAppOnRequestPermissionResult(PEnv, this, requestCode, permission, 
    grantResult);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnBroadcastReceiver
  Signature: (JLandroid/content/Intent;)V }
procedure pOnBroadcastReceiver(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  intent: JObject); cdecl;
begin
  Java_Event_pOnBroadcastReceiver(PEnv, this, TObject(pasobj), intent);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnCustomCameraSurfaceCreated
  Signature: (J)V }
procedure pOnCustomCameraSurfaceCreated(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong); cdecl;
begin
  Java_Event_pOnCustomCameraSurfaceCreated(PEnv, this, TObject(pasobj));
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnCustomCameraSurfaceChanged
  Signature: (JII)V }
procedure pOnCustomCameraSurfaceChanged(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; width: JInt; height: JInt); cdecl;
begin
  Java_Event_pOnCustomCameraSurfaceChanged(PEnv, this, TObject(pasobj), width, 
    height);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnCustomCameraPictureTaken
  Signature: (JLandroid/graphics/Bitmap;Ljava/lang/String;)V }
procedure pOnCustomCameraPictureTaken(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; picture: JObject; fullPath: JString); cdecl;
begin
  Java_Event_pOnCustomCameraPictureTaken(PEnv, this, TObject(pasobj), picture, 
    fullPath);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnCustomDialogShow
  Signature: (JLandroid/app/Dialog;Ljava/lang/String;)V }
procedure pOnCustomDialogShow(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  dialog: JObject; title: JString); cdecl;
begin
  Java_Event_pOnCustomDialogShow(PEnv, this, TObject(pasobj), dialog, title);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnCustomDialogBackKeyPressed
  Signature: (JLjava/lang/String;)V }
procedure pOnCustomDialogBackKeyPressed(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; title: JString); cdecl;
begin
  Java_Event_pOnCustomDialogBackKeyPressed(PEnv, this, TObject(pasobj), title);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnDatePicker
  Signature: (JIII)V }
procedure pOnDatePicker(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  year: JInt; monthOfYear: JInt; dayOfMonth: JInt); cdecl;
begin
  Java_Event_pOnDatePicker(PEnv, this, TObject(pasobj), year, monthOfYear, 
    dayOfMonth);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnHttpClientContentResult
  Signature: (JLjava/lang/String;)V }
procedure pOnHttpClientContentResult(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; content: JString); cdecl;
begin
  Java_Event_pOnHttpClientContentResult(PEnv, this, TObject(pasobj), content);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnHttpClientCodeResult
  Signature: (JI)V }
procedure pOnHttpClientCodeResult(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  code: JInt); cdecl;
begin
  Java_Event_pOnHttpClientCodeResult(PEnv, this, TObject(pasobj), code);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnHttpClientUploadProgress
  Signature: (JJ)V }
procedure pOnHttpClientUploadProgress(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; progress: JLong); cdecl;
begin
  Java_Event_pOnHttpClientUploadProgress(PEnv, this, TObject(pasobj), progress);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnHttpClientUploadFinished
  Signature: (JILjava/lang/String;Ljava/lang/String;)V }
procedure pOnHttpClientUploadFinished(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; connectionStatusCode: JInt; connectionStatusMessage: JString; 
  fullFileName: JString); cdecl;
begin
  Java_Event_pOnHttpClientUploadFinished(PEnv, this, TObject(pasobj), 
    connectionStatusCode, connectionStatusMessage, fullFileName);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnClickWidgetItem
  Signature: (JIZ)V }
procedure pOnClickWidgetItem(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  position: JInt; checked: JBoolean); cdecl;
begin
  Java_Event_pOnClickWidgetItem(PEnv, this, TObject(pasobj), position, checked);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnClickCaptionItem
  Signature: (JILjava/lang/String;)V }
procedure pOnClickCaptionItem(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  position: JInt; caption: JString); cdecl;
begin
  Java_Event_pOnClickCaptionItem(PEnv, this, TObject(pasobj), position, caption
    );
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnListViewLongClickCaptionItem
  Signature: (JILjava/lang/String;)V }
procedure pOnListViewLongClickCaptionItem(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; position: JInt; caption: JString); cdecl;
begin
  Java_Event_pOnListViewLongClickCaptionItem(PEnv, this, TObject(pasobj), 
    position, caption);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnListViewDrawItemCaptionColor
  Signature: (JILjava/lang/String;)I }
function pOnListViewDrawItemCaptionColor(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; position: JInt; caption: JString): JInt; cdecl;
begin
  Result:=Java_Event_pOnListViewDrawItemCaptionColor(PEnv, this, TObject(pasobj
    ), position, caption);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnListViewDrawItemBitmap
  Signature: (JILjava/lang/String;)Landroid/graphics/Bitmap; }
function pOnListViewDrawItemBitmap(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  position: JInt; caption: JString): JObject; cdecl;
begin
  Result:=Java_Event_pOnListViewDrawItemBitmap(PEnv, this, TObject(pasobj), 
    position, caption);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnWidgeItemLostFocus
  Signature: (JILjava/lang/String;)V }
procedure pOnWidgeItemLostFocus(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  position: JInt; widgetText: JString); cdecl;
begin
  Java_Event_pOnWidgeItemLostFocus(PEnv, this, TObject(pasobj), position, 
    widgetText);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnListViewScrollStateChanged
  Signature: (JIIIZ)V }
procedure pOnListViewScrollStateChanged(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; firstVisibleItem: JInt; visibleItemCount: JInt; 
  totalItemCount: JInt; lastItemReached: JBoolean); cdecl;
begin
  Java_Event_pOnListViewScrollStateChanged(PEnv, this, TObject(pasobj), 
    firstVisibleItem, visibleItemCount, totalItemCount, lastItemReached);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnListViewDrawItemWidgetTextColor
  Signature: (JILjava/lang/String;)I }
function pOnListViewDrawItemWidgetTextColor(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; position: JInt; widgetText: JString): JInt; cdecl;
begin
  Result:=Java_Event_pOnListViewDrawItemWidgetTextColor(PEnv, this, TObject(
    pasobj), position, widgetText);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnListViewDrawItemWidgetImage
  Signature: (JILjava/lang/String;)Landroid/graphics/Bitmap; }
function pOnListViewDrawItemWidgetImage(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; position: JInt; widgetText: JString): JObject; cdecl;
begin
  Result:=Java_Event_pOnListViewDrawItemWidgetImage(PEnv, this, TObject(pasobj
    ), position, widgetText);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pRadioGroupCheckedChanged
  Signature: (JILjava/lang/String;)V }
procedure pRadioGroupCheckedChanged(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; checkedIndex: JInt; checkedCaption: JString); cdecl;
begin
  Java_Event_pRadioGroupCheckedChanged(PEnv, this, TObject(pasobj), 
    checkedIndex, checkedCaption);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnRatingBarChanged
  Signature: (JF)V }
procedure pOnRatingBarChanged(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  rating: JFloat); cdecl;
begin
  Java_Event_pOnRatingBarChanged(PEnv, this, TObject(pasobj), rating);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnClickNavigationViewItem
  Signature: (JILjava/lang/String;)V }
procedure pOnClickNavigationViewItem(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; itemId: JInt; itemCaption: JString); cdecl;
begin
  Java_Event_pOnClickNavigationViewItem(PEnv, this, TObject(pasobj), itemId, 
    itemCaption);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnSpinnerItemSeleceted
  Signature: (JILjava/lang/String;)V }
procedure pOnSpinnerItemSeleceted(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  position: JInt; caption: JString); cdecl;
begin
  Java_Event_pOnSpinnerItemSeleceted(PEnv, this, TObject(pasobj), position, 
    caption);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnRecyclerViewItemClick
  Signature: (JII)V }
procedure pOnRecyclerViewItemClick(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  itemIndex: JInt; arrayContentCount: JInt); cdecl;
begin
  Java_Event_pOnRecyclerViewItemClick(PEnv, this, TObject(pasobj), itemIndex, 
    arrayContentCount);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnRecyclerViewItemWidgetClick
  Signature: (JIILjava/lang/String;I)V }
procedure pOnRecyclerViewItemWidgetClick(PEnv: PJNIEnv; this: JObject; 
  pasobj: JLong; itemIndex: JInt; widgetClass: JInt; widgetCaption: JString; 
  status: JInt); cdecl;
begin
  Java_Event_pOnRecyclerViewItemWidgetClick(PEnv, this, TObject(pasobj), 
    itemIndex, widgetClass, widgetCaption, status);
end;

{ Class:     org_lamw_residency4rent_Controls
  Method:    pOnTimePicker
  Signature: (JII)V }
procedure pOnTimePicker(PEnv: PJNIEnv; this: JObject; pasobj: JLong; 
  hourOfDay: JInt; minute: JInt); cdecl;
begin
  Java_Event_pOnTimePicker(PEnv, this, TObject(pasobj), hourOfDay, minute);
end;

const NativeMethods: array[0..64] of JNINativeMethod = (
   (name: 'pAppOnCreate';
    signature: '(Landroid/content/Context;Landroid/widget/RelativeLayout;'
      +'Landroid/content/Intent;)V';
    fnPtr: @pAppOnCreate; ),
   (name: 'pAppOnScreenStyle';
    signature: '()I';
    fnPtr: @pAppOnScreenStyle; ),
   (name: 'pAppOnNewIntent';
    signature: '(Landroid/content/Intent;)V';
    fnPtr: @pAppOnNewIntent; ),
   (name: 'pAppOnDestroy';
    signature: '()V';
    fnPtr: @pAppOnDestroy; ),
   (name: 'pAppOnPause';
    signature: '()V';
    fnPtr: @pAppOnPause; ),
   (name: 'pAppOnRestart';
    signature: '()V';
    fnPtr: @pAppOnRestart; ),
   (name: 'pAppOnResume';
    signature: '()V';
    fnPtr: @pAppOnResume; ),
   (name: 'pAppOnStart';
    signature: '()V';
    fnPtr: @pAppOnStart; ),
   (name: 'pAppOnStop';
    signature: '()V';
    fnPtr: @pAppOnStop; ),
   (name: 'pAppOnBackPressed';
    signature: '()V';
    fnPtr: @pAppOnBackPressed; ),
   (name: 'pAppOnRotate';
    signature: '(I)I';
    fnPtr: @pAppOnRotate; ),
   (name: 'pAppOnConfigurationChanged';
    signature: '()V';
    fnPtr: @pAppOnConfigurationChanged; ),
   (name: 'pAppOnActivityResult';
    signature: '(IILandroid/content/Intent;)V';
    fnPtr: @pAppOnActivityResult; ),
   (name: 'pAppOnCreateOptionsMenu';
    signature: '(Landroid/view/Menu;)V';
    fnPtr: @pAppOnCreateOptionsMenu; ),
   (name: 'pAppOnClickOptionMenuItem';
    signature: '(Landroid/view/MenuItem;ILjava/lang/String;Z)V';
    fnPtr: @pAppOnClickOptionMenuItem; ),
   (name: 'pAppOnPrepareOptionsMenu';
    signature: '(Landroid/view/Menu;I)Z';
    fnPtr: @pAppOnPrepareOptionsMenu; ),
   (name: 'pAppOnPrepareOptionsMenuItem';
    signature: '(Landroid/view/Menu;Landroid/view/MenuItem;I)Z';
    fnPtr: @pAppOnPrepareOptionsMenuItem; ),
   (name: 'pAppOnCreateContextMenu';
    signature: '(Landroid/view/ContextMenu;)V';
    fnPtr: @pAppOnCreateContextMenu; ),
   (name: 'pAppOnClickContextMenuItem';
    signature: '(Landroid/view/MenuItem;ILjava/lang/String;Z)V';
    fnPtr: @pAppOnClickContextMenuItem; ),
   (name: 'pOnDraw';
    signature: '(J)V';
    fnPtr: @pOnDraw; ),
   (name: 'pOnTouch';
    signature: '(JIIFFFF)V';
    fnPtr: @pOnTouch; ),
   (name: 'pOnClickGeneric';
    signature: '(JI)V';
    fnPtr: @pOnClickGeneric; ),
   (name: 'pAppOnSpecialKeyDown';
    signature: '(CILjava/lang/String;)Z';
    fnPtr: @pAppOnSpecialKeyDown; ),
   (name: 'pOnClick';
    signature: '(JI)V';
    fnPtr: @pOnClick; ),
   (name: 'pOnLongClick';
    signature: '(JI)V';
    fnPtr: @pOnLongClick; ),
   (name: 'pOnChange';
    signature: '(JLjava/lang/String;I)V';
    fnPtr: @pOnChange; ),
   (name: 'pOnChanged';
    signature: '(JLjava/lang/String;I)V';
    fnPtr: @pOnChanged; ),
   (name: 'pOnEnter';
    signature: '(J)V';
    fnPtr: @pOnEnter; ),
   (name: 'pOnClose';
    signature: '(J)V';
    fnPtr: @pOnClose; ),
   (name: 'pAppOnViewClick';
    signature: '(Landroid/view/View;I)V';
    fnPtr: @pAppOnViewClick; ),
   (name: 'pAppOnListItemClick';
    signature: '(Landroid/widget/AdapterView;Landroid/view/View;II)V';
    fnPtr: @pAppOnListItemClick; ),
   (name: 'pOnFlingGestureDetected';
    signature: '(JI)V';
    fnPtr: @pOnFlingGestureDetected; ),
   (name: 'pOnPinchZoomGestureDetected';
    signature: '(JFI)V';
    fnPtr: @pOnPinchZoomGestureDetected; ),
   (name: 'pOnLostFocus';
    signature: '(JLjava/lang/String;)V';
    fnPtr: @pOnLostFocus; ),
   (name: 'pOnBeforeDispatchDraw';
    signature: '(JLandroid/graphics/Canvas;I)V';
    fnPtr: @pOnBeforeDispatchDraw; ),
   (name: 'pOnAfterDispatchDraw';
    signature: '(JLandroid/graphics/Canvas;I)V';
    fnPtr: @pOnAfterDispatchDraw; ),
   (name: 'pOnLayouting';
    signature: '(JZ)V';
    fnPtr: @pOnLayouting; ),
   (name: 'pAppOnRequestPermissionResult';
    signature: '(ILjava/lang/String;I)V';
    fnPtr: @pAppOnRequestPermissionResult; ),
   (name: 'pOnBroadcastReceiver';
    signature: '(JLandroid/content/Intent;)V';
    fnPtr: @pOnBroadcastReceiver; ),
   (name: 'pOnCustomCameraSurfaceCreated';
    signature: '(J)V';
    fnPtr: @pOnCustomCameraSurfaceCreated; ),
   (name: 'pOnCustomCameraSurfaceChanged';
    signature: '(JII)V';
    fnPtr: @pOnCustomCameraSurfaceChanged; ),
   (name: 'pOnCustomCameraPictureTaken';
    signature: '(JLandroid/graphics/Bitmap;Ljava/lang/String;)V';
    fnPtr: @pOnCustomCameraPictureTaken; ),
   (name: 'pOnCustomDialogShow';
    signature: '(JLandroid/app/Dialog;Ljava/lang/String;)V';
    fnPtr: @pOnCustomDialogShow; ),
   (name: 'pOnCustomDialogBackKeyPressed';
    signature: '(JLjava/lang/String;)V';
    fnPtr: @pOnCustomDialogBackKeyPressed; ),
   (name: 'pOnDatePicker';
    signature: '(JIII)V';
    fnPtr: @pOnDatePicker; ),
   (name: 'pOnHttpClientContentResult';
    signature: '(JLjava/lang/String;)V';
    fnPtr: @pOnHttpClientContentResult; ),
   (name: 'pOnHttpClientCodeResult';
    signature: '(JI)V';
    fnPtr: @pOnHttpClientCodeResult; ),
   (name: 'pOnHttpClientUploadProgress';
    signature: '(JJ)V';
    fnPtr: @pOnHttpClientUploadProgress; ),
   (name: 'pOnHttpClientUploadFinished';
    signature: '(JILjava/lang/String;Ljava/lang/String;)V';
    fnPtr: @pOnHttpClientUploadFinished; ),
   (name: 'pOnClickWidgetItem';
    signature: '(JIZ)V';
    fnPtr: @pOnClickWidgetItem; ),
   (name: 'pOnClickCaptionItem';
    signature: '(JILjava/lang/String;)V';
    fnPtr: @pOnClickCaptionItem; ),
   (name: 'pOnListViewLongClickCaptionItem';
    signature: '(JILjava/lang/String;)V';
    fnPtr: @pOnListViewLongClickCaptionItem; ),
   (name: 'pOnListViewDrawItemCaptionColor';
    signature: '(JILjava/lang/String;)I';
    fnPtr: @pOnListViewDrawItemCaptionColor; ),
   (name: 'pOnListViewDrawItemBitmap';
    signature: '(JILjava/lang/String;)Landroid/graphics/Bitmap;';
    fnPtr: @pOnListViewDrawItemBitmap; ),
   (name: 'pOnWidgeItemLostFocus';
    signature: '(JILjava/lang/String;)V';
    fnPtr: @pOnWidgeItemLostFocus; ),
   (name: 'pOnListViewScrollStateChanged';
    signature: '(JIIIZ)V';
    fnPtr: @pOnListViewScrollStateChanged; ),
   (name: 'pOnListViewDrawItemWidgetTextColor';
    signature: '(JILjava/lang/String;)I';
    fnPtr: @pOnListViewDrawItemWidgetTextColor; ),
   (name: 'pOnListViewDrawItemWidgetImage';
    signature: '(JILjava/lang/String;)Landroid/graphics/Bitmap;';
    fnPtr: @pOnListViewDrawItemWidgetImage; ),
   (name: 'pRadioGroupCheckedChanged';
    signature: '(JILjava/lang/String;)V';
    fnPtr: @pRadioGroupCheckedChanged; ),
   (name: 'pOnRatingBarChanged';
    signature: '(JF)V';
    fnPtr: @pOnRatingBarChanged; ),
   (name: 'pOnClickNavigationViewItem';
    signature: '(JILjava/lang/String;)V';
    fnPtr: @pOnClickNavigationViewItem; ),
   (name: 'pOnSpinnerItemSeleceted';
    signature: '(JILjava/lang/String;)V';
    fnPtr: @pOnSpinnerItemSeleceted; ),
   (name: 'pOnRecyclerViewItemClick';
    signature: '(JII)V';
    fnPtr: @pOnRecyclerViewItemClick; ),
   (name: 'pOnRecyclerViewItemWidgetClick';
    signature: '(JIILjava/lang/String;I)V';
    fnPtr: @pOnRecyclerViewItemWidgetClick; ),
   (name: 'pOnTimePicker';
    signature: '(JII)V';
    fnPtr: @pOnTimePicker; )
);

function RegisterNativeMethodsArray(PEnv: PJNIEnv; className: PChar; 
  methods: PJNINativeMethod; countMethods: integer): integer;
var
  curClass: jClass;
begin
  Result:= JNI_FALSE;
  curClass:= (PEnv^).FindClass(PEnv, className);
  if curClass <> nil then
  begin
    if (PEnv^).RegisterNatives(PEnv, curClass, methods, countMethods) > 0 
      then Result:= JNI_TRUE;
  end;
end;

function RegisterNativeMethods(PEnv: PJNIEnv; className: PChar): integer;
begin
  Result:= RegisterNativeMethodsArray(PEnv, className, @NativeMethods[0], Length
    (NativeMethods));
end;

function JNI_OnLoad(VM: PJavaVM; {%H-}reserved: pointer): JInt; cdecl;
var
  PEnv: PPointer;
  curEnv: PJNIEnv;
begin
  PEnv:= nil;
  Result:= JNI_VERSION_1_6;
  (VM^).GetEnv(VM, @PEnv, Result);
  if PEnv <> nil then
  begin
     curEnv:= PJNIEnv(PEnv);
     RegisterNativeMethods(curEnv, 'org/lamw/residency4rent/Controls');
  end;
  gVM:= VM; {AndroidWidget.pas}
end;

procedure JNI_OnUnload(VM: PJavaVM; {%H-}reserved: pointer); cdecl;
var
  PEnv: PPointer;
  curEnv: PJNIEnv;
begin
  PEnv:= nil;
  (VM^).GetEnv(VM, @PEnv, JNI_VERSION_1_6);
  if PEnv <> nil then
  begin
    curEnv:= PJNIEnv(PEnv);
    (curEnv^).DeleteGlobalRef(curEnv, gjClass);
    gjClass:= nil; {AndroidWidget.pas}
    gVM:= nil; {AndroidWidget.pas}
  end;
  gApp.Terminate;
  FreeAndNil(gApp);
end;

exports
  JNI_OnLoad name 'JNI_OnLoad',
  JNI_OnUnload name 'JNI_OnUnload',
  pAppOnCreate name 'Java_org_lamw_residency4rent_Controls_pAppOnCreate',
  pAppOnScreenStyle name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnScreenStyle',
  pAppOnNewIntent name 'Java_org_lamw_residency4rent_Controls_pAppOnNewIntent',
  pAppOnDestroy name 'Java_org_lamw_residency4rent_Controls_pAppOnDestroy',
  pAppOnPause name 'Java_org_lamw_residency4rent_Controls_pAppOnPause',
  pAppOnRestart name 'Java_org_lamw_residency4rent_Controls_pAppOnRestart',
  pAppOnResume name 'Java_org_lamw_residency4rent_Controls_pAppOnResume',
  pAppOnStart name 'Java_org_lamw_residency4rent_Controls_pAppOnStart',
  pAppOnStop name 'Java_org_lamw_residency4rent_Controls_pAppOnStop',
  pAppOnBackPressed name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnBackPressed',
  pAppOnRotate name 'Java_org_lamw_residency4rent_Controls_pAppOnRotate',
  pAppOnConfigurationChanged name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnConfigurationChanged',
  pAppOnActivityResult name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnActivityResult',
  pAppOnCreateOptionsMenu name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnCreateOptionsMenu',
  pAppOnClickOptionMenuItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnClickOptionMenuItem',
  pAppOnPrepareOptionsMenu name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnPrepareOptionsMenu',
  pAppOnPrepareOptionsMenuItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnPrepareOptionsMenuItem',
  pAppOnCreateContextMenu name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnCreateContextMenu',
  pAppOnClickContextMenuItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnClickContextMenuItem',
  pOnDraw name 'Java_org_lamw_residency4rent_Controls_pOnDraw',
  pOnTouch name 'Java_org_lamw_residency4rent_Controls_pOnTouch',
  pOnClickGeneric name 'Java_org_lamw_residency4rent_Controls_pOnClickGeneric',
  pAppOnSpecialKeyDown name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnSpecialKeyDown',
  pOnClick name 'Java_org_lamw_residency4rent_Controls_pOnClick',
  pOnLongClick name 'Java_org_lamw_residency4rent_Controls_pOnLongClick',
  pOnChange name 'Java_org_lamw_residency4rent_Controls_pOnChange',
  pOnChanged name 'Java_org_lamw_residency4rent_Controls_pOnChanged',
  pOnEnter name 'Java_org_lamw_residency4rent_Controls_pOnEnter',
  pOnClose name 'Java_org_lamw_residency4rent_Controls_pOnClose',
  pAppOnViewClick name 'Java_org_lamw_residency4rent_Controls_pAppOnViewClick',
  pAppOnListItemClick name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnListItemClick',
  pOnFlingGestureDetected name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnFlingGestureDetected',
  pOnPinchZoomGestureDetected name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnPinchZoomGestureDetected',
  pOnLostFocus name 'Java_org_lamw_residency4rent_Controls_pOnLostFocus',
  pOnBeforeDispatchDraw name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnBeforeDispatchDraw',
  pOnAfterDispatchDraw name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnAfterDispatchDraw',
  pOnLayouting name 'Java_org_lamw_residency4rent_Controls_pOnLayouting',
  pAppOnRequestPermissionResult name 'Java_org_lamw_residency4rent_Controls_'
    +'pAppOnRequestPermissionResult',
  pOnBroadcastReceiver name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnBroadcastReceiver',
  pOnCustomCameraSurfaceCreated name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnCustomCameraSurfaceCreated',
  pOnCustomCameraSurfaceChanged name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnCustomCameraSurfaceChanged',
  pOnCustomCameraPictureTaken name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnCustomCameraPictureTaken',
  pOnCustomDialogShow name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnCustomDialogShow',
  pOnCustomDialogBackKeyPressed name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnCustomDialogBackKeyPressed',
  pOnDatePicker name 'Java_org_lamw_residency4rent_Controls_pOnDatePicker',
  pOnHttpClientContentResult name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnHttpClientContentResult',
  pOnHttpClientCodeResult name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnHttpClientCodeResult',
  pOnHttpClientUploadProgress name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnHttpClientUploadProgress',
  pOnHttpClientUploadFinished name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnHttpClientUploadFinished',
  pOnClickWidgetItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnClickWidgetItem',
  pOnClickCaptionItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnClickCaptionItem',
  pOnListViewLongClickCaptionItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnListViewLongClickCaptionItem',
  pOnListViewDrawItemCaptionColor name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnListViewDrawItemCaptionColor',
  pOnListViewDrawItemBitmap name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnListViewDrawItemBitmap',
  pOnWidgeItemLostFocus name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnWidgeItemLostFocus',
  pOnListViewScrollStateChanged name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnListViewScrollStateChanged',
  pOnListViewDrawItemWidgetTextColor name 'Java_org_lamw_residency4rent_'
    +'Controls_pOnListViewDrawItemWidgetTextColor',
  pOnListViewDrawItemWidgetImage name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnListViewDrawItemWidgetImage',
  pRadioGroupCheckedChanged name 'Java_org_lamw_residency4rent_Controls_'
    +'pRadioGroupCheckedChanged',
  pOnRatingBarChanged name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnRatingBarChanged',
  pOnClickNavigationViewItem name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnClickNavigationViewItem',
  pOnSpinnerItemSeleceted name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnSpinnerItemSeleceted',
  pOnRecyclerViewItemClick name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnRecyclerViewItemClick',
  pOnRecyclerViewItemWidgetClick name 'Java_org_lamw_residency4rent_Controls_'
    +'pOnRecyclerViewItemWidgetClick',
  pOnTimePicker name 'Java_org_lamw_residency4rent_Controls_pOnTimePicker';

{%endregion}
  
begin
  gApp:= jApp.Create(nil);
  gApp.Title:= 'LAMW JNI Android Bridges Library';
  gjAppName:= 'org.lamw.residency4rent';
  gjClassName:= 'org/lamw/residency4rent/Controls';
  gApp.AppName:=gjAppName;
  gApp.ClassName:=gjClassName;
  gApp.Initialize;
  gApp.CreateForm(TAndroidModule1, AndroidModule1);
end.
