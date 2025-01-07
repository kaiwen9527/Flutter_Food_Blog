# Flutter_Food_Blog

* 由於平時喜歡拍攝美食，所以試著模擬 APP 版的美食小部落，將以往的一些作品放進來並且加上一些自己的心得或感受，然後再附上資訊及店家，最後呈現的是一個簡易的美食部落格應用 APP。

* 此 APP 可以將拍攝的照片及心得、介紹、店家與食物的資訊儲存至文章裡，內容看個人喜好。而因可能美食品項會太多時，可將一些品項加入至自訂的標籤分類裡面，這樣能更加便利的做使用。

## 開場動畫

  https://github.com/user-attachments/assets/38652b10-0999-4553-aba0-47e1793ee1dc


## 主頁

* 底部有幾張預覽圖片，點擊可至此圖片的單一介面。
* 右上圖示可做語言切換，而右下的按鈕可做日夜背景模式切換。

  <img src="https://github.com/user-attachments/assets/80928423-2121-42c3-ba25-80593983abf7" width="300px">  <img src="https://github.com/user-attachments/assets/64f8e0ca-1893-4e23-88f9-1c1c582bdad0" width="300px">

### 頭像放大

* 長壓主頁的頭像後會將圖像放大 (類似 ig 的做法)。

  <img src="https://github.com/user-attachments/assets/ce27f297-975c-4530-97c8-a293dc274db2" width="300px">

## 美食文章列表

* 右下漂浮按鈕可直接滾至頂部位置。

  <img src="https://github.com/user-attachments/assets/57919afd-67f1-4402-8ce6-6f4d2f6f6e52" width="300px">  <img src="https://github.com/user-attachments/assets/4e01beff-d8f3-46f6-ac06-b66300e999f5" width="300px">

* 滾動會有圖片的視覺差效果。

  https://github.com/user-attachments/assets/92c130e4-5814-49f0-a1e5-13088398298e

* 滑至最底部時會加載資料，當無資料時會提示無資料了。

  <img src="https://github.com/user-attachments/assets/d544c7ee-3d90-473e-b827-edeeaa06d77d" width="300px">

## 單一美食界面

* 每個美食品項會有一個單一的介面，有圖片、心得、品名與價位、地址，一些基本資訊。

  <img src="https://github.com/user-attachments/assets/5a46155a-7480-4bfb-82d8-80701599ffdb" width="300px">  <img src="https://github.com/user-attachments/assets/adcb120a-a94b-450b-9f41-cb499a054747" width="300px">

## 標籤分類頁面

* 在右上角的輸入框輸入想要的標籤名稱，按下左邊的新增按鈕會以 **TarBar** 的方式來新增每個標籤的列表頁面。

  <img src="https://github.com/user-attachments/assets/c6ed54a3-28a6-49f8-909d-e0b17ff599c3" width="300px">  <img src="https://github.com/user-attachments/assets/ced69949-7908-43fb-9b2a-653e25137d7a" width="300px">

## 加入標籤

* 點選在單一美食界面右上角的 『 + 』 圖示就會出現上述新增的標籤選項，這時就可選擇想加入的標籤。加入某個標籤後就會顯示已加入。

  <img src="https://github.com/user-attachments/assets/2b6e8964-fb36-48ef-a5a0-d628e15dfeeb" width="300px">  <img src="https://github.com/user-attachments/assets/0a2d9625-aba8-47dc-a270-1cc984e8741b" width="300px">

* 加入後會顯示在分類的頁面裡。品項的右上角圖示可移除品項。

  <img src="https://github.com/user-attachments/assets/4474e579-6623-4178-a04f-4b0cd2628dbc" width="300px">

* 如果要刪除某個標籤，則需先清除此標籤裡的所有品項才可移除，否則會出現提示。

  <img src="https://github.com/user-attachments/assets/75f0aa0d-8a76-4b4c-9b97-1fb5b25e3f34" width="300px">

## 語言切換

* 主頁右上的語言圖示可做語言切換，目前有**繁體中文**與**英文**。

  <img src="https://github.com/user-attachments/assets/8887750f-6662-4006-b6b4-97ee22d40ee9" width="300px">  

* 當切換至英文時會將所有有文字的地方切換成英文 (**主頁**與**食物介面**為例)。

  <img src="https://github.com/user-attachments/assets/e7d7b47e-0e41-4e32-8f8c-c31783cce527" width="300px">  <img src="https://github.com/user-attachments/assets/65307aec-7940-4610-b860-a76bb51b35f9" width="300px">


## dependencies

provider: ^6.1.2

flutter_screenutil: ^5.9.3

flutter_localizations:
  sdk: flutter

intl: ^0.19.0

progress_dialog_null_safe: ^3.0.0

easy_refresh: ^3.4.0

## Version

Flutter SDK -- 3.24.4

Android SDK -- 35.0.0

Dart Version -- 3.5.4

DevTools Version -- 2.37.3

Java JDK -- 17.0.11

