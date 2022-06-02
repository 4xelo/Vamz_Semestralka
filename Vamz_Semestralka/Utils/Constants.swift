//
//  Constants.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        // MARK: - Category URL
        static let recipeCategoryURL = URL (string: "https://recipesapi.herokuapp.com/api/v2/categories")!
        
        // MARK: - Recipe URL
        static func recipeByCategoryName(_ name: String) -> URL {
            return URL(string: "https://recipesapi.herokuapp.com/api/v2/recipes?q=\(name)&page=1")!
        }
        
        
    }
    struct FoodImages {
        
        static let chickenImages = ["https://imgs.search.brave.com/CwHC33u_UrGIbJHGJwIYGzYpklZV4IchKcIPxGfHbns/rs:fit:1000:1000:1/g:ce/aHR0cHM6Ly9rZXZp/bmlzY29va2luZy5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MjAvMDUvQmFrZWQt/VGV4LU1leC1DaGlj/a2VuLXNxdWFyZS5q/cGc",
            "https://imgs.search.brave.com/WRXucRYc9OLRYge6IMjWc_CSLYZxIIAP5DgjqJx7hes/rs:fit:1200:1200:1/g:ce/aHR0cDovL2RlbC5o/LWNkbi5jby9hc3Nl/dHMvMTcvMzUvMTUw/NDE5NTc5MS1sZW1v/bi1wZXBwZXItY2hp/Y2tlbi12ZXJ0aWNh/bC5qcGc",
        "https://imgs.search.brave.com/p4G4SrVx9pKVxPWiCWvXyjNuQU12QxvxnP9Vom9_s_U/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9zLnlp/bWcuY29tL3V1L2Fw/aS9yZXMvMS4yL2Nm/Um1KZ0hCTjF6NC4y/N0pBdkJTSHctLX5C/L2FEMHhNek16TzNj/OU1qQXdNRHRoY0hC/cFpEMTVkR0ZqYUhs/dmJnLS0vaHR0cHM6/Ly9tZWRpYS56ZW5m/cy5jb20vZW4vZm9v/ZF93aW5lXzgwNC8y/ZjFkMGFmNmJmN2I4/M2M5Y2Q5Zjc5OGU3/MmM1Y2FiNg",
        "https://imgs.search.brave.com/6kJRAOZ1JwU3SwAbEuRXUnc9XPZ4SXwHwCjTuzXhR6I/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9oZWFs/dGhpZnlibG9nLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/MC8wNi9jaGlja2Vu/LWJyZWFzdC1yZWNp/cGVzLWUxNTkyMDU3/NzI1NTk1LmpwZw",
        "https://imgs.search.brave.com/4ydtGbs7SvZo2MvhYoZXzdPWKO652pulbQD3B-ZaS1s/rs:fit:900:1200:1/g:ce/aHR0cHM6Ly90YXR5/YW5hc2V2ZXJ5ZGF5/Zm9vZC5jb20vd3At/Y29udGVudC91cGxv/YWRzLzIwMjAvMDgv/VGVyaXlha2ktQ2hp/Y2tlbi1CcmVhc3Qt/cmVjaXBlLmpwZw"]
        
        static let pizzaImages = ["https://imgs.search.brave.com/YHxSAFWOnaB4NFOrSZ2ByhglQl15ze3x9D8d19xSqlg/rs:fit:1200:1100:1/g:ce/aHR0cHM6Ly93d3cu/c2NlbnRvZmJhc2ls/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAxNi8wNi8xNjA1/MTZfUGl6emFfTWFy/Z2hlcml0YS0xNTAw/eDExMDAuanBn",
          "https://imgs.search.brave.com/RO8JYOHimkolZUuAi7aNF56ZRa6zuTdWpJnBZ2keSAQ/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/a29zaGVyLmNvbS9y/ZXNpemVkL29wZW5f/Z3JhcGgvaS9tL0lN/R18xMzc0LWQzNzBm/ZGIwZThjYzc0OWQ1/YmM1MGQyMGYyZDVl/MzliLXNjYWxlZC5q/cGc",
          "https://imgs.search.brave.com/ztRSUODM1relXexrVaAZhBMy-NYhDd8kgw_DCxjSL7s/rs:fit:1200:1000:1/g:ce/aHR0cHM6Ly9zLWku/aHVmZnBvc3QuY29t/L2dlbi8xNTU0MjM2/L2ltYWdlcy9vLVhC/T1gtUElaWkEtSFVU/LWZhY2Vib29rLmpw/Zw",
          "https://imgs.search.brave.com/GZ7_3AIz6XR1psskLEl9ff4NpngmUccOxcVePqSH-Cw/rs:fit:1000:1000:1/g:ce/aHR0cHM6Ly9yb21h/c21kLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMC8wNy9z/dXByZW1lLmpwZw",
          "https://imgs.search.brave.com/hl38iel4zJBx1ov42phmACKAbxts54ukftU0--AY9d8/rs:fit:1200:752:1/g:ce/aHR0cHM6Ly9pbnNw/aXJpbmdyZWNpcGVp/ZGVhcy5jb20vd3At/Y29udGVudC91cGxv/YWRzLzIwMTgvMDMv/TWV4aWNhbi1Pcmln/aW5hbC1QaXp6YS1w/aG90by0xLmpwZw" ]
        
        static let breakFastImages = ["https://imgs.search.brave.com/MXkKe4awlEDgM6FpjqAuhSx8SR-BJLDlz3TvcNtCnds/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5w/Q1VxWHE5STdDV29D/MFppcFdZcnRBSGFF/NyZwaWQ9QXBp",
          "https://imgs.search.brave.com/jGFU69RKQcEfC96aNX7WgsZv0itLg05RfIwZi1Wer0Q/rs:fit:1200:1200:1/g:ce/aHR0cDovL3N1cmZz/dHJlbmd0aGNvYWNo/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAxMS8wMy9icmVh/a2Zhc3QuanBn",
          "https://imgs.search.brave.com/RENUxtBnVU95B6whPlsYaUfkRngr-4VrWlW9aC9SvIo/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9maXRu/ZXNzYW5kaGVhbHRo/bWF0dGVycy5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTYv/MTIvaGVhbHRoeS1i/cmVha2Zhc3QtZmVh/dHVyZS5qcGc",
          "https://imgs.search.brave.com/v_52vAlrjNnYj_BubDy2B-Rb0srCQWHSGXyZD3Lj8sY/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9jb250/ZW50LnByZXNzcGFn/ZS5jb20vdXBsb2Fk/cy85NDUvMTkyMF9m/cy1icmtsbmstb3Jp/Zy1jbGFzc2ljcGxh/dGUuanBnPzEwMDAw",
          "https://imgs.search.brave.com/PavHzKIHeAlSgNnRn1EEKnHmwL9g_SjAVak0zoKvvp4/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9zdGF0/aWMud2l4c3RhdGlj/LmNvbS9tZWRpYS80/MWQzMWRfZmRhMGJl/YWZmNjE4NGRkOThh/NzNmNGM1NjhjNzRi/YTl-bXYyX2RfNjcy/MF80NDgwX3NfNF8y/LmpwZy92MS9maXQv/d18yNTAwLGhfMTMz/MCxhbF9jLzQxZDMx/ZF9mZGEwYmVhZmY2/MTg0ZGQ5OGE3M2Y0/YzU2OGM3NGJhOX5t/djJfZF82NzIwXzQ0/ODBfc180XzIuanBn"]
        
        static let baconImages = ["https://imgs.search.brave.com/vqEOwezMbhyvZtwfTkZi9ijr1nm1IUTkwmUfU1Ok4Ik/rs:fit:1200:1125:1/g:ce/aHR0cDovL3NpdGVz/LnBzdS5lZHUvc2lv/d2ZhMTUvd3AtY29u/dGVudC91cGxvYWRz/L3NpdGVzLzI5NjM5/LzIwMTUvMTAvQmFj/b24uanBn",
          "https://imgs.search.brave.com/uxwQZcwrILLpo7Nkxp3TgP10bYWaIqFswzkb9WwdRuU/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMyLm1pbnV0ZW1l/ZGlhY2RuLmNvbS9p/bWFnZS91cGxvYWQv/Y19maWxsLGdfYXV0/byxoXzEyNDgsd18y/MjIwL3YxNTU1MzAx/OTY2L3NoYXBlL21l/bnRhbGZsb3NzL2lz/dG9ja18zNDg1ODY0/MF9zbWFsbC5qcGc_/aXRvaz11SlFaUTJ4/Mg",
          "https://imgs.search.brave.com/KRkHvM-2trShTGFVAK9r27TFehgLOn2SDV9JIl08Ixc/rs:fit:1200:933:1/g:ce/aHR0cHM6Ly9zMy5h/bWF6b25hd3MuY29t/L2N1cG9mc3VnYXJw/aW5jaG9mc2FsdC93/cC1jb250ZW50L3Vw/bG9hZHMvMjAxNS8w/My8wMTA5MzQ1Ni9C/YWNvbi1tZWRpdW0x/LmpwZw",
          "https://imgs.search.brave.com/PT6R5HeYYXfYMTZ6XGEiuRfuNhHY4fKwSiREK4Ddj2o/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/Y2hhcmxvdHRlZmFz/aGlvbnBsYXRlLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/OC8xMi9pbWdfNTE5/OS1lMTU1NTA5NzEx/NDcyOS5qcGc",
          "https://imgs.search.brave.com/hPwvMovMibcAN5wOE5CYQJYEmdI-nZjBDXo6tD0nrLo/rs:fit:1024:1024:1/g:ce/aHR0cDovL2Nkbi5z/aG9waWZ5LmNvbS9z/L2ZpbGVzLzEvMjM3/My8xMjM5L3Byb2R1/Y3RzL3Byb2R1Y3Qt/YmVlZi1iYWNvbl8y/eF9lNGZiMjdlNC00/ZTNiLTRjMTktYTYz/OS1iMmE4MDU4YTQ0/ZDFfMTAyNHgxMDI0/LmpwZz92PTE1MDk1/NjU1ODY"]
        
        static let steakImages = ["https://imgs.search.brave.com/ZS1r5kvxyOB3IrDRHVvQl-zvAbyK7EDhsu84vjV_o6g/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/Ym93cml2ZXJtZWF0/bWFya2V0LmNhL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDIwLzA0/L0Fkb2JlU3RvY2tf/Mjk3MzQzNjg2LTEt/MjA0OHgxMzY1Lmpw/ZWc",
          "https://imgs.search.brave.com/2ZQzEqMu4Uv0ZOdaxddGOya4Ac_u2m9FjqHtL7Nisew/rs:fit:1136:924:1/g:ce/aHR0cDovL3d3dy5m/YW1pbHljaG9pY2Vm/b29kcy5jb20vd3At/Y29udGVudC91cGxv/YWRzLzIwMTYvMDIv/aXRhbGlhbm8yNTAu/cG5n",
          "https://imgs.search.brave.com/3ciiF1JbBSdlnzJhY_aEB-WwrRZB0jgRzL2E95dkRog/rs:fit:1200:860:1/g:ce/aHR0cHM6Ly93d3cu/b3JnYW5pY2F1dGhv/cml0eS5jb20vLmlt/YWdlL3Rfc2hhcmUv/TVRVNU16TXdNamMz/TWpJM056WTNNemt5/L3N0ZWFrLWNjZmxj/ci15b25nZm9vay5q/cGc",
          "https://imgs.search.brave.com/igjGzhzhXCX0EZcPa5OFfXeBMo_a5LY4Kb4-v1N5mQg/rs:fit:1000:619:1/g:ce/aHR0cDovL2ZhcnJh/Z3V0bGlmZS5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTkv/MDQvTG9uZ2hvcm4t/c3RlYWstV0VCLmpw/Zw",
          "https://imgs.search.brave.com/XTwQ5gJ5nhUUvZdfIQ3Q4TcPBxsbACRLzKRrUj8TPB4/rs:fit:1200:830:1/g:ce/aHR0cHM6Ly9lbWJl/ZC53aWRlbmNkbi5u/ZXQvaW1nL2JlZWYv/bndla2RyYnViYi8x/NTAweDgzMHB4L2dy/aWxsZWQtYmVlZi1z/dGVhay1jb2xvcmZ1/bC1wZXBwZXJzLnRp/Zi5qcGc_a2VlcD1j"]
        
        static let indianImages = ["https://imgs.search.brave.com/2A_iU53tXeOXj8i1DWBG4QGv8rnQTKy6PABX1VkW_TE/rs:fit:1200:1200:1/g:ce/aHR0cDovL3d3dy5l/cmljYWp1bHNvbi5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MTYvMTIvSW5kaWFu/LUJ1dHRlci1DaGlj/a2VuLmpwZw",
          "https://imgs.search.brave.com/k6LuhPPolkHkosJuW9_1Xaw8mV0dbs-MM13I2fB6DB4/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9uZXdl/bmdsYW5kLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvaW5kaWFu/LXB1ZGRpbmctd2lk/ZS5qcGc"]
        
        static let asianImages = ["https://imgs.search.brave.com/n9II8YXmkXio7qJa5PtvvJRNbUR_tHkHz4cjPOfIO-0/rs:fit:1200:1143:1/g:ce/aHR0cHM6Ly9zdGF0/aWMuaW5kZXBlbmRl/bnQuY28udWsvczNm/cy1wdWJsaWMvdGh1/bWJuYWlscy9pbWFn/ZS8yMDE3LzAyLzA3/LzE1L2NoaW5lc2Uu/anBn",
          "https://imgs.search.brave.com/ItxabSjBn9U91FtGsa4xMtOfyeL7Gni84SwjNvn98C8/rs:fit:1200:1200:1/g:ce/aHR0cDovL2FuaW1v/bWFnYXppbmUucGgv/d3AtY29udGVudC91/cGxvYWRzLzIwMTgv/MDQvSU1HXzg5OTAu/anBn",
          "https://imgs.search.brave.com/wdUTCYBLMUOpqugWGeWi1wGkE98b8g-Y1pG7vMHTSmk/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9leHRl/cm5hbC1wcmV2aWV3/LnJlZGQuaXQvRUpw/ei1Td0tUNHlwMGdL/WkNxRWQzY1psWkdZ/STJLdHVGbDBkWjlR/LTMxYy5qcGc_YXV0/bz13ZWJwJnM9NDFi/MmZlODI4YzU3YmI4/Yzc5MzE5YTBhZDhj/ZGViYjcxNzg3NWRj/NQ",
          "https://imgs.search.brave.com/1LVtGFcaXYp0FvLK4L6a3GIsoTkr8E_e95IfiRoqfvk/rs:fit:1200:1200:1/g:ce/aHR0cDovL2VhdG5v/cnRoLmNhL3NpdGVz/L2RlZmF1bHQvZmls/ZXMvZmllbGQvaW1h/Z2UvY3Jpc3B5X3Rv/ZnUuanBn",
          "https://imgs.search.brave.com/pV0YMAPZ6ePSAeLu1pPnIJYqlM_cL3o8vskbDnkk_YI/rs:fit:1200:800:1/g:ce/aHR0cHM6Ly90b2Rh/eXN3b3JsZGtpdGNo/ZW4uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE2LzExL051/bWJlci01LWltYWdl/LmpwZWc"]
    
    }
    
}
