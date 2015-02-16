package main

import (
    "fmt"
    "time"
    "net/http"
    "encoding/json"
    "sort"
)

func h_default(w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Hello World!\n")
}

func h_time(w http.ResponseWriter, r *http.Request) {
    const layout = time.RFC3339
    t := time.Now()
    fmt.Fprintf(w, "%s\n", t.UTC().Format(layout))
}

// all in an effort to sort the slice of floats
type fArray []float64
func (s fArray) Len() int { return len(s) }
func (s fArray) Swap(i, j int) { s[i], s[j] = s[j], s[i] }
func (s fArray) Less(i, j int) bool { return s[i] < s[j] }

func h_sort(w http.ResponseWriter, r *http.Request)  {
    decoder := json.NewDecoder(r.Body)
    encoder := json.NewEncoder(w)
    var a []float64
    err := decoder.Decode(&a)
    if err != nil {
        w.WriteHeader(http.StatusBadRequest)
    } else {
        sort.Sort(fArray(a))
        err := encoder.Encode(&a)
        if err != nil {
            w.WriteHeader(http.StatusBadRequest)
        }
    }
}
func main() {
    http.HandleFunc("/", h_default)
    http.HandleFunc("/time", h_time)
    http.HandleFunc("/sort", h_sort)
    http.ListenAndServe(":8080", nil)
}
