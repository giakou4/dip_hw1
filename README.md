# Ψηφιακή Επεξεργασία Εικόνας

## -Εργασία 1-
Σημειακός μετασχηματισμός και διόρθωση ιστογράμματος
Α. Ντελόπουλος
Άνοιξη 2020

### Εισαγωγικά
Στην παρούσα εργασία θα επεξεργαστείτε μία εικόνα με στόχο να τροποποιήσετε το ιστόγραμμά της. Οι ακό-
λουθες εντολές θα σας βοηθήσουν να φορτώσετε την εικόνα που σας δίνεται με τον κατάλληλο τρόπο ώστε να την
επεξεργαστείτε, καθώς και να δείξετε το ιστόγραμμα της φωτεινότητάς της. Σημειώστε ότι οι τιμές φωτεινότητας είναι
πραγματικοί αριθμοί στο διάστημα [0; 1] με το μαύρο να αντιστοιχεί στο 0 και το άσπρο στο 1.
```
% Load image , and convert it to gray -scale
x = imread('lena.bmp');
x = rgb2gray(x);
x = double(x) / 255;
% Show the histogram of intensity values
[hn , hx] = hist(x(:), 0:1/255:1);
figure
bar(hx , hn)
```

### 1. Σημειακός μετασχηματισμός
Στην πρώτη ενότητα της εργασίας θα υλοποιήσετε έναν σημειακό μετασχηματισμό συγκεκριμένης μορφής. Συ-
γκεκριμένα, κατασκευάστε την συνάρτηση
```
Y = pointtransform(X, x1, y1, x2, y2) (1)
```
η οποία λαμβάνει ως είσοδο μία μονοχρωματική εικόνα X και την μετασχηματίζει σημειακά στην εικόνα Y, σύμφωνα με
τον μετασχηματισμό που φαίνεται στο Σχήμα 1. Οι μεταβλητές x1, y1, x2 και y2 ορίζουν τα δύο σημεία της καμπύλης
που απεικονίζεται στο Σχήμα 1. Παρουσιάστε τα αποτελέσματα του μετασχηματισμού για τις περιπτώσεις (α) [x1,
y1, x2, y2] = [0.1961, 0.0392, 0.8039, 0.9608] και (β) για τιμές παραμέτρων τέτοιες ώστε η εικόνα εξό-
δου να είναι ασπρόμαυρη, κατωφλιωμένη στην τιμή φωτεινότητας 0:5.

### 2. Μετασχηματισμοί ιστογράμματος
Στη δεύτερη ενότητα της εργασίας θα μετασχηματίσετε την εικόνα εισόδου με στόχο η εικόνα εξόδου να έχει
συγκεκριμένες προδιαγραφές στο ιστόγραμμά της.

#### 2.1 Μετασχηματισμός με βάση το ιστόγραμμα
Κατασκευάστε τη συνάρτηση
```
Y = histtransform(X, h, v)
```
η οποία μετασχηματίζει την εικόνα εισόδου X στην εικόνα εξόδου Y έτσι ώστε το ιστόγραμμα της Y να προσεγγίζει όσο
καλύτερα γίνεται το ιστόγραμμα που περιγράφεται από τα h και v. Τα h και v είναι διανύσματα μήκους n, όπου n είναι
ο αριθμός των κλάσεων φωτεινότητας της εξόδου. Το διάνυσμα v περιέχει (σε αύξουσα σειρά) τις τιμές φωτεινότητας
τις οποίες θα περιέχει η Y. Αυτές είναι δηλαδή οι μόνες τιμές φωτεινότητας οι οποίες μπορούν εμφανιστούν στην Y. Το
διάνυσμα h περιέχει κατά αντιστοιχία με τις τιμές του v τις τιμές του ιστογράμματος, δηλαδή το h(i) είναι το ποσοστό
των pixels της Y τα οποία θα πρέπει να έχουν φωτεινότητα v(i) (Σχήμα 2). Θα πρέπει να ισχύει
Σn
i=1 h(i) = 1 και
h(i) > 0 για i = 1; 2; : : : ; n.
Η υλοποίησή σας θα πρέπει να είναι ένας greedy αλγόριθμος ο οποίος ξεκινάει από τα pixel με τη χαμηλότερη φω-
τεινότητα (δηλαδή 0) και τα μετασχηματίζει ώστε να έχουν φωτεινότητα ίση με v(1). Η διαδικασία επαναλαμβάνεται
επαναληπτικά για τις επόμενες στάθμες φωτεινότητας (1; 2; : : :) όσο 
{αριθμός των pixels που έχουν αναταθεί στην τιμή v(1) / συνολικός αριθμός pixels της εικόνας} < h(1)
Ο έλεγχος γίνεται αφού μετασχηματιστούν όλα τα pixels μίας συγκεκριμένης τιμής φωτεινότητας. Όταν αυξηθεί ο
αριθμός των pixels αρκετά ώστε να μην ισχύει η παραπάνω συνθήκη, η διαδικασία συνεχίζει κανονικά με τη διαφορά
ότι τώρα τα pixels ανατίθενται επόμενη τιμή φωτεινότητας (δηλαδή στην v(2)) και ο αντίστοιχος λόγος των pixels
που ανατίθεται σε αυτή την τιμή (προς τα συνολικά) συγκρίνεται με το h(2). Η διαδικασία συνεχίζεται επαναληπτικά
έως ότου μετασχηματιστούν όλα τα pixels της
```
% Case 1
L = 10;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
% Case 2
L = 20;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
% Case 1
L = 10;
v = linspace (0, 1, L);
h = normpdf(v, 0.5) / sum(normpdf(v, 0.5));
```
Για κάθε περίπτωση παρουσιάστε την εικόνα και το ιστόγραμμά της, και τα σχόλιά σας σχετικά με το πόσο καλά
προσεγγίζεται το επιθυμητό ιστόγραμμα.

#### 2.2 Εκτίμηση ιστογράμματος από κατανομή
Σε αυτό το ζητούμενο θα υλοποιήσετε τη συνάρτηση
```
h = pdf2hist(d, f)
```
η οποία υπολογίζει τις τιμές του ιστογράμματος h στα διαστήματα που ορίζει το d. Το d είναι ένα διάνυσμα μήκους
n + 1 το οποίο ορίζει n διαδοχικά διαστήματα με τον ακόλουθο τρόπο
[d(1); d(2)]; [d(2); d(3)]; : : : ; [d(end - 1); d(end)]
ενώ το f είναι function pointer. Θεωρείστε ότι η δήλωση της f είναι της μορφής
p = f(v)
όπου p είναι η πυκνότητα της πιθανότητας στην τιμή v. Συνεπώς, θα πρέπει για κάθε διάστημα που ορίζει το d να
χρησιμοποιήσετε μία μέθοδο αριθμητικής ολοκλήρωσης για να υπολογίσετε την πιθανότητα η φωτεινότητα να έχει
τιμή στο συγκεκριμένο διάστημα. Θα πρέπει να εξηγήσετε συγκεκριμένα την υλοποίησή σας σε αυτό το σημείο. Επίσης,
επειδή στη γενική περίπτωση η f είναι μη μηδενική εκτός του διαστήματος [h(1); h(end)] θα πρέπει στο τέλος να
κανονικοποιήσετε γραμμικά το ιστόγραμμά σας ώστε να ισχύει
Σh(i) = 1.

#### 2.3 Μετασχηματισμός με βάση την πυκνότητα πιθανότητας
Χρησιμοποιείστε τις συναρτήσεις που κατασκευάσατε στα προηγούμενα ζητούμενα και μετασχηματίστε την εικόνα
που σας δίνεται έτσι ώστε το ιστόγραμμα της μετασχηματισμένης εικόνας να προσεγγίζει ιστόγραμμα που αντιστοιχεί
σε
1. Ομοιόμορφη κατανομή στο [0; 1]
2. Ομοιόμορφη κατανομή στο [0; 2]
3. Κανονική κατανομή με μέση τιμή 0:5 και τυπική απόκλιση 0:1.
Θα πρέπει να προδιαγράψετε τον τρόπο με τον οποίο θα επιλέξετε τα διαστήματα d στα οποία θα υπολογίσετε
το ιστόγραμμα. Ως σύμβαση, θεωρείστε ότι κάθε διάστημα που ορίζει το d αντιστοιχίζεται σε φωτεινότητα ίση με το
μέσον του διαστήματος. Σε κάθε περίπτωση, παρουσιάστε τα αποτελέσματά σας χρησιμοποιώντας την εικόνα εισόδου
που σας δόθηκε.

## Support

Reach out to me:
- [giakou4's email](mailto:giakonick98@gmail.com "giakonick98@gmail.com")

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/giakou4/dip_hw1/LICENSE)
