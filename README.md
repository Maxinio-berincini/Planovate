# Planovate

## Infos

Diese App ist im Rahmen einer Projektarbeit an der Universität entstanden.
Sie wurde mithilfe von Flutter in der Programmiersprache Dart entwickelt.
Flutter ist opensource Framework für die Entwicklung von Platformübergreifenden Apps.

## Links zur App

### Andoid

## Aufbau der App

Diese App besteht aus einer Menge automatisch generierten Dateien. Der eigentliche Code, sowie weitere relevanten Inhalte befinden sich in den Ordnern "libn" (Library) und "assets".

### assets

In diesem Ordner befinden sich alle Grafiken und Schriftarten, welche für die Benutzeroberfläche der App verwendet wurden.

### Library

In der Library (lib) befinden sich alle Dateien, welche für den Inhalt der App relevant sind.
Die App ist so gegliedert, dass der Code für jede Seite in einer eigenen Datei geschrieben ist.
Ebenfalls gibt es Dateien, welche global für den Style zuständig sind, diese befinden sich in dem Ordner "helper".

### Aufbau des Codes

Grundsätzlich ist jede Datei, welche Code enthält, gleich aufgebaut:

* scaffold  -  initialisiert das Grundgerüst der Seite.
    * title  -  zeigt den Titel der Seite an.
    * body  -  hier wird der Inhalt der jeweiligen Seite angezeigt.

Der inhalt der App ist baum-förmig aufgebaut mittels sogenannten widgets.
Am Beispiel dieser App sieht dass dann etwa wie folgt aus:
Wenn der Inhalt in einer Liste ist, dann ist das oberste widget eine Liste. in der Liste befindet sich dann zum Beispiel eine Spalte.
Darin wiederum befinden sich Detektoren, welche prüfen, ob auf den Inhalt geklickt wird. Dieser Inhalt besteht dann aus Einem Bild und einem weiteren Knopf, welcher wiederum aus einem Hintergrund und einem Icon besteht.



## Code Review

Um die App bestmöglichst anschauen zu können empfehle ich direkt Flutter zu verwenden.

Die Dokumentation zur Installation von Android Studio und Flutter kann unter folgendem Link gefunden werden:

[Flutter Documentation](https://docs.flutter.dev/get-started/install/ "Flutter Documentation")



## Code Usage

Falls jemand diese App weiterentwickeln möchte, kann dieser Code gerne als Grundlage verwendet werden.

