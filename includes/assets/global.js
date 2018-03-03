/*
 * jQuery Form Plugin; v20130616
 * http://jquery.malsup.com/form/
 * Copyright (c) 2013 M. Alsup; Dual licensed: MIT/GPL
 * https://github.com/malsup/form#copyright-and-license
 */
(function (e) {
    "use strict";
    function t(t) {
        var r = t.data;
        t.isDefaultPrevented() || (t.preventDefault(), e(this).ajaxSubmit(r))
    }

    function r(t) {
        var r = t.target, a = e(r);
        if (!a.is("[type=submit],[type=image]")) {
            var n = a.closest("[type=submit]");
            if (0 === n.length)return;
            r = n[0]
        }
        var i = this;
        if (i.clk = r, "image" == r.type)if (void 0 !== t.offsetX)i.clk_x = t.offsetX, i.clk_y = t.offsetY; else if ("function" == typeof e.fn.offset) {
            var o = a.offset();
            i.clk_x = t.pageX - o.left, i.clk_y = t.pageY - o.top
        } else i.clk_x = t.pageX - r.offsetLeft, i.clk_y = t.pageY - r.offsetTop;
        setTimeout(function () {
            i.clk = i.clk_x = i.clk_y = null
        }, 100)
    }

    function a() {
        if (e.fn.ajaxSubmit.debug) {
            var t = "[jquery.form] " + Array.prototype.join.call(arguments, "");
            window.console && window.console.log ? window.console.log(t) : window.opera && window.opera.postError && window.opera.postError(t)
        }
    }

    var n = {};
    n.fileapi = void 0 !== e("<input type='file'/>").get(0).files, n.formdata = void 0 !== window.FormData;
    var i = !!e.fn.prop;
    e.fn.attr2 = function () {
        if (!i)return this.attr.apply(this, arguments);
        var e = this.prop.apply(this, arguments);
        return e && e.jquery || "string" == typeof e ? e : this.attr.apply(this, arguments)
    }, e.fn.ajaxSubmit = function (t) {
        function r(r) {
            var a, n, i = e.param(r, t.traditional).split("&"), o = i.length, s = [];
            for (a = 0; o > a; a++)i[a] = i[a].replace(/\+/g, " "), n = i[a].split("="), s.push([decodeURIComponent(n[0]), decodeURIComponent(n[1])]);
            return s
        }

        function o(a) {
            for (var n = new FormData, i = 0; a.length > i; i++)n.append(a[i].name, a[i].value);
            if (t.extraData) {
                var o = r(t.extraData);
                for (i = 0; o.length > i; i++)o[i] && n.append(o[i][0], o[i][1])
            }
            t.data = null;
            var s = e.extend(!0, {}, e.ajaxSettings, t, {
                contentType: !1,
                processData: !1,
                cache: !1,
                type: u || "POST"
            });
            t.uploadProgress && (s.xhr = function () {
                var r = e.ajaxSettings.xhr();
                return r.upload && r.upload.addEventListener("progress", function (e) {
                    var r = 0, a = e.loaded || e.position, n = e.total;
                    e.lengthComputable && (r = Math.ceil(100 * (a / n))), t.uploadProgress(e, a, n, r)
                }, !1), r
            }), s.data = null;
            var l = s.beforeSend;
            return s.beforeSend = function (e, t) {
                t.data = n, l && l.call(this, e, t)
            }, e.ajax(s)
        }

        function s(r) {
            function n(e) {
                var t = null;
                try {
                    e.contentWindow && (t = e.contentWindow.document)
                } catch (r) {
                    a("cannot get iframe.contentWindow document: " + r)
                }
                if (t)return t;
                try {
                    t = e.contentDocument ? e.contentDocument : e.document
                } catch (r) {
                    a("cannot get iframe.contentDocument: " + r), t = e.document
                }
                return t
            }

            function o() {
                function t() {
                    try {
                        var e = n(g).readyState;
                        a("state = " + e), e && "uninitialized" == e.toLowerCase() && setTimeout(t, 50)
                    } catch (r) {
                        a("Server abort: ", r, " (", r.name, ")"), s(D), j && clearTimeout(j), j = void 0
                    }
                }

                var r = f.attr2("target"), i = f.attr2("action");
                w.setAttribute("target", d), u || w.setAttribute("method", "POST"), i != m.url && w.setAttribute("action", m.url), m.skipEncodingOverride || u && !/post/i.test(u) || f.attr({
                    encoding: "multipart/form-data",
                    enctype: "multipart/form-data"
                }), m.timeout && (j = setTimeout(function () {
                    T = !0, s(k)
                }, m.timeout));
                var o = [];
                try {
                    if (m.extraData)for (var l in m.extraData)m.extraData.hasOwnProperty(l) && (e.isPlainObject(m.extraData[l]) && m.extraData[l].hasOwnProperty("name") && m.extraData[l].hasOwnProperty("value") ? o.push(e('<input type="hidden" name="' + m.extraData[l].name + '">').val(m.extraData[l].value).appendTo(w)[0]) : o.push(e('<input type="hidden" name="' + l + '">').val(m.extraData[l]).appendTo(w)[0]));
                    m.iframeTarget || (v.appendTo("body"), g.attachEvent ? g.attachEvent("onload", s) : g.addEventListener("load", s, !1)), setTimeout(t, 15);
                    try {
                        w.submit()
                    } catch (c) {
                        var p = document.createElement("form").submit;
                        p.apply(w)
                    }
                } finally {
                    w.setAttribute("action", i), r ? w.setAttribute("target", r) : f.removeAttr("target"), e(o).remove()
                }
            }

            function s(t) {
                if (!x.aborted && !F) {
                    if (M = n(g), M || (a("cannot access response document"), t = D), t === k && x)return x.abort("timeout"), S.reject(x, "timeout"), void 0;
                    if (t == D && x)return x.abort("server abort"), S.reject(x, "error", "server abort"), void 0;
                    if (M && M.location.href != m.iframeSrc || T) {
                        g.detachEvent ? g.detachEvent("onload", s) : g.removeEventListener("load", s, !1);
                        var r, i = "success";
                        try {
                            if (T)throw"timeout";
                            var o = "xml" == m.dataType || M.XMLDocument || e.isXMLDoc(M);
                            if (a("isXml=" + o), !o && window.opera && (null === M.body || !M.body.innerHTML) && --O)return a("requeing onLoad callback, DOM not available"), setTimeout(s, 250), void 0;
                            var u = M.body ? M.body : M.documentElement;
                            x.responseText = u ? u.innerHTML : null, x.responseXML = M.XMLDocument ? M.XMLDocument : M, o && (m.dataType = "xml"), x.getResponseHeader = function (e) {
                                var t = {"content-type": m.dataType};
                                return t[e]
                            }, u && (x.status = Number(u.getAttribute("status")) || x.status, x.statusText = u.getAttribute("statusText") || x.statusText);
                            var l = (m.dataType || "").toLowerCase(), c = /(json|script|text)/.test(l);
                            if (c || m.textarea) {
                                var f = M.getElementsByTagName("textarea")[0];
                                if (f)x.responseText = f.value, x.status = Number(f.getAttribute("status")) || x.status, x.statusText = f.getAttribute("statusText") || x.statusText; else if (c) {
                                    var d = M.getElementsByTagName("pre")[0], h = M.getElementsByTagName("body")[0];
                                    d ? x.responseText = d.textContent ? d.textContent : d.innerText : h && (x.responseText = h.textContent ? h.textContent : h.innerText)
                                }
                            } else"xml" == l && !x.responseXML && x.responseText && (x.responseXML = X(x.responseText));
                            try {
                                L = _(x, l, m)
                            } catch (b) {
                                i = "parsererror", x.error = r = b || i
                            }
                        } catch (b) {
                            a("error caught: ", b), i = "error", x.error = r = b || i
                        }
                        x.aborted && (a("upload aborted"), i = null), x.status && (i = x.status >= 200 && 300 > x.status || 304 === x.status ? "success" : "error"), "success" === i ? (m.success && m.success.call(m.context, L, "success", x), S.resolve(x.responseText, "success", x), p && e.event.trigger("ajaxSuccess", [x, m])) : i && (void 0 === r && (r = x.statusText), m.error && m.error.call(m.context, x, i, r), S.reject(x, "error", r), p && e.event.trigger("ajaxError", [x, m, r])), p && e.event.trigger("ajaxComplete", [x, m]), p && !--e.active && e.event.trigger("ajaxStop"), m.complete && m.complete.call(m.context, x, i), F = !0, m.timeout && clearTimeout(j), setTimeout(function () {
                            m.iframeTarget || v.remove(), x.responseXML = null
                        }, 100)
                    }
                }
            }

            var l, c, m, p, d, v, g, x, b, y, T, j, w = f[0], S = e.Deferred();
            if (r)for (c = 0; h.length > c; c++)l = e(h[c]), i ? l.prop("disabled", !1) : l.removeAttr("disabled");
            if (m = e.extend(!0, {}, e.ajaxSettings, t), m.context = m.context || m, d = "jqFormIO" + (new Date).getTime(), m.iframeTarget ? (v = e(m.iframeTarget), y = v.attr2("name"), y ? d = y : v.attr2("name", d)) : (v = e('<iframe name="' + d + '" src="' + m.iframeSrc + '" />'), v.css({
                    position: "absolute",
                    top: "-1000px",
                    left: "-1000px"
                })), g = v[0], x = {
                    aborted: 0,
                    responseText: null,
                    responseXML: null,
                    status: 0,
                    statusText: "n/a",
                    getAllResponseHeaders: function () {
                    },
                    getResponseHeader: function () {
                    },
                    setRequestHeader: function () {
                    },
                    abort: function (t) {
                        var r = "timeout" === t ? "timeout" : "aborted";
                        a("aborting upload... " + r), this.aborted = 1;
                        try {
                            g.contentWindow.document.execCommand && g.contentWindow.document.execCommand("Stop")
                        } catch (n) {
                        }
                        v.attr("src", m.iframeSrc), x.error = r, m.error && m.error.call(m.context, x, r, t), p && e.event.trigger("ajaxError", [x, m, r]), m.complete && m.complete.call(m.context, x, r)
                    }
                }, p = m.global, p && 0 === e.active++ && e.event.trigger("ajaxStart"), p && e.event.trigger("ajaxSend", [x, m]), m.beforeSend && m.beforeSend.call(m.context, x, m) === !1)return m.global && e.active--, S.reject(), S;
            if (x.aborted)return S.reject(), S;
            b = w.clk, b && (y = b.name, y && !b.disabled && (m.extraData = m.extraData || {}, m.extraData[y] = b.value, "image" == b.type && (m.extraData[y + ".x"] = w.clk_x, m.extraData[y + ".y"] = w.clk_y)));
            var k = 1, D = 2, A = e("meta[name=csrf-token]").attr("content"), E = e("meta[name=csrf-param]").attr("content");
            E && A && (m.extraData = m.extraData || {}, m.extraData[E] = A), m.forceSync ? o() : setTimeout(o, 10);
            var L, M, F, O = 50, X = e.parseXML || function (e, t) {
                    return window.ActiveXObject ? (t = new ActiveXObject("Microsoft.XMLDOM"), t.async = "false", t.loadXML(e)) : t = (new DOMParser).parseFromString(e, "text/xml"), t && t.documentElement && "parsererror" != t.documentElement.nodeName ? t : null
                }, C = e.parseJSON || function (e) {
                    return window.eval("(" + e + ")")
                }, _ = function (t, r, a) {
                var n = t.getResponseHeader("content-type") || "", i = "xml" === r || !r && n.indexOf("xml") >= 0, o = i ? t.responseXML : t.responseText;
                return i && "parsererror" === o.documentElement.nodeName && e.error && e.error("parsererror"), a && a.dataFilter && (o = a.dataFilter(o, r)), "string" == typeof o && ("json" === r || !r && n.indexOf("json") >= 0 ? o = C(o) : ("script" === r || !r && n.indexOf("javascript") >= 0) && e.globalEval(o)), o
            };
            return S
        }

        if (!this.length)return a("ajaxSubmit: skipping submit process - no element selected"), this;
        var u, l, c, f = this;
        "function" == typeof t && (t = {success: t}), u = t.type || this.attr2("method"), l = t.url || this.attr2("action"), c = "string" == typeof l ? e.trim(l) : "", c = c || window.location.href || "", c && (c = (c.match(/^([^#]+)/) || [])[1]), t = e.extend(!0, {
            url: c,
            success: e.ajaxSettings.success,
            type: u || "GET",
            iframeSrc: /^https/i.test(window.location.href || "") ? "javascript:false" : "about:blank"
        }, t);
        var m = {};
        if (this.trigger("form-pre-serialize", [this, t, m]), m.veto)return a("ajaxSubmit: submit vetoed via form-pre-serialize trigger"), this;
        if (t.beforeSerialize && t.beforeSerialize(this, t) === !1)return a("ajaxSubmit: submit aborted via beforeSerialize callback"), this;
        var p = t.traditional;
        void 0 === p && (p = e.ajaxSettings.traditional);
        var d, h = [], v = this.formToArray(t.semantic, h);
        if (t.data && (t.extraData = t.data, d = e.param(t.data, p)), t.beforeSubmit && t.beforeSubmit(v, this, t) === !1)return a("ajaxSubmit: submit aborted via beforeSubmit callback"), this;
        if (this.trigger("form-submit-validate", [v, this, t, m]), m.veto)return a("ajaxSubmit: submit vetoed via form-submit-validate trigger"), this;
        var g = e.param(v, p);
        d && (g = g ? g + "&" + d : d), "GET" == t.type.toUpperCase() ? (t.url += (t.url.indexOf("?") >= 0 ? "&" : "?") + g, t.data = null) : t.data = g;
        var x = [];
        if (t.resetForm && x.push(function () {
                f.resetForm()
            }), t.clearForm && x.push(function () {
                f.clearForm(t.includeHidden)
            }), !t.dataType && t.target) {
            var b = t.success || function () {
                };
            x.push(function (r) {
                var a = t.replaceTarget ? "replaceWith" : "html";
                e(t.target)[a](r).each(b, arguments)
            })
        } else t.success && x.push(t.success);
        if (t.success = function (e, r, a) {
                for (var n = t.context || this, i = 0, o = x.length; o > i; i++)x[i].apply(n, [e, r, a || f, f])
            }, t.error) {
            var y = t.error;
            t.error = function (e, r, a) {
                var n = t.context || this;
                y.apply(n, [e, r, a, f])
            }
        }
        if (t.complete) {
            var T = t.complete;
            t.complete = function (e, r) {
                var a = t.context || this;
                T.apply(a, [e, r, f])
            }
        }
        var j = e('input[type=file]:enabled[value!=""]', this), w = j.length > 0, S = "multipart/form-data", k = f.attr("enctype") == S || f.attr("encoding") == S, D = n.fileapi && n.formdata;
        a("fileAPI :" + D);
        var A, E = (w || k) && !D;
        t.iframe !== !1 && (t.iframe || E) ? t.closeKeepAlive ? e.get(t.closeKeepAlive, function () {
            A = s(v)
        }) : A = s(v) : A = (w || k) && D ? o(v) : e.ajax(t), f.removeData("jqxhr").data("jqxhr", A);
        for (var L = 0; h.length > L; L++)h[L] = null;
        return this.trigger("form-submit-notify", [this, t]), this
    }, e.fn.ajaxForm = function (n) {
        if (n = n || {}, n.delegation = n.delegation && e.isFunction(e.fn.on), !n.delegation && 0 === this.length) {
            var i = {s: this.selector, c: this.context};
            return !e.isReady && i.s ? (a("DOM not ready, queuing ajaxForm"), e(function () {
                e(i.s, i.c).ajaxForm(n)
            }), this) : (a("terminating; zero elements found by selector" + (e.isReady ? "" : " (DOM not ready)")), this)
        }
        return n.delegation ? (e(document).off("submit.form-plugin", this.selector, t).off("click.form-plugin", this.selector, r).on("submit.form-plugin", this.selector, n, t).on("click.form-plugin", this.selector, n, r), this) : this.ajaxFormUnbind().on("submit.form-plugin", n, t).on("click.form-plugin", n, r)
    }, e.fn.ajaxFormUnbind = function () {
        return this.off("submit.form-plugin click.form-plugin")
    }, e.fn.formToArray = function (t, r) {
        var a = [];
        if (0 === this.length)return a;
        var i = this[0], o = t ? i.getElementsByTagName("*") : i.elements;
        if (!o)return a;
        var s, u, l, c, f, m, p;
        for (s = 0, m = o.length; m > s; s++)if (f = o[s], l = f.name, l && !f.disabled)if (t && i.clk && "image" == f.type)i.clk == f && (a.push({
            name: l,
            value: e(f).val(),
            type: f.type
        }), a.push({name: l + ".x", value: i.clk_x}, {
            name: l + ".y",
            value: i.clk_y
        })); else if (c = e.fieldValue(f, !0), c && c.constructor == Array)for (r && r.push(f), u = 0, p = c.length; p > u; u++)a.push({
            name: l,
            value: c[u]
        }); else if (n.fileapi && "file" == f.type) {
            r && r.push(f);
            var d = f.files;
            if (d.length)for (u = 0; d.length > u; u++)a.push({
                name: l,
                value: d[u],
                type: f.type
            }); else a.push({name: l, value: "", type: f.type})
        } else null !== c && c !== void 0 && (r && r.push(f), a.push({
            name: l,
            value: c,
            type: f.type,
            required: f.required
        }));
        if (!t && i.clk) {
            var h = e(i.clk), v = h[0];
            l = v.name, l && !v.disabled && "image" == v.type && (a.push({
                name: l,
                value: h.val()
            }), a.push({name: l + ".x", value: i.clk_x}, {name: l + ".y", value: i.clk_y}))
        }
        return a
    }, e.fn.formSerialize = function (t) {
        return e.param(this.formToArray(t))
    }, e.fn.fieldSerialize = function (t) {
        var r = [];
        return this.each(function () {
            var a = this.name;
            if (a) {
                var n = e.fieldValue(this, t);
                if (n && n.constructor == Array)for (var i = 0, o = n.length; o > i; i++)r.push({
                    name: a,
                    value: n[i]
                }); else null !== n && n !== void 0 && r.push({name: this.name, value: n})
            }
        }), e.param(r)
    }, e.fn.fieldValue = function (t) {
        for (var r = [], a = 0, n = this.length; n > a; a++) {
            var i = this[a], o = e.fieldValue(i, t);
            null === o || void 0 === o || o.constructor == Array && !o.length || (o.constructor == Array ? e.merge(r, o) : r.push(o))
        }
        return r
    }, e.fieldValue = function (t, r) {
        var a = t.name, n = t.type, i = t.tagName.toLowerCase();
        if (void 0 === r && (r = !0), r && (!a || t.disabled || "reset" == n || "button" == n || ("checkbox" == n || "radio" == n) && !t.checked || ("submit" == n || "image" == n) && t.form && t.form.clk != t || "select" == i && -1 == t.selectedIndex))return null;
        if ("select" == i) {
            var o = t.selectedIndex;
            if (0 > o)return null;
            for (var s = [], u = t.options, l = "select-one" == n, c = l ? o + 1 : u.length, f = l ? o : 0; c > f; f++) {
                var m = u[f];
                if (m.selected) {
                    var p = m.value;
                    if (p || (p = m.attributes && m.attributes.value && !m.attributes.value.specified ? m.text : m.value), l)return p;
                    s.push(p)
                }
            }
            return s
        }
        return e(t).val()
    }, e.fn.clearForm = function (t) {
        return this.each(function () {
            e("input,select,textarea", this).clearFields(t)
        })
    }, e.fn.clearFields = e.fn.clearInputs = function (t) {
        var r = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;
        return this.each(function () {
            var a = this.type, n = this.tagName.toLowerCase();
            r.test(a) || "textarea" == n ? this.value = "" : "checkbox" == a || "radio" == a ? this.checked = !1 : "select" == n ? this.selectedIndex = -1 : "file" == a ? /MSIE/.test(navigator.userAgent) ? e(this).replaceWith(e(this).clone(!0)) : e(this).val("") : t && (t === !0 && /hidden/.test(a) || "string" == typeof t && e(this).is(t)) && (this.value = "")
        })
    }, e.fn.resetForm = function () {
        return this.each(function () {
            ("function" == typeof this.reset || "object" == typeof this.reset && !this.reset.nodeType) && this.reset()
        })
    }, e.fn.enable = function (e) {
        return void 0 === e && (e = !0), this.each(function () {
            this.disabled = !e
        })
    }, e.fn.selected = function (t) {
        return void 0 === t && (t = !0), this.each(function () {
            var r = this.type;
            if ("checkbox" == r || "radio" == r)this.checked = t; else if ("option" == this.tagName.toLowerCase()) {
                var a = e(this).parent("select");
                t && a[0] && "select-one" == a[0].type && a.find("option").selected(!1), this.selected = t
            }
        })
    }, e.fn.ajaxSubmit.debug = !1
})(jQuery);
/* Cookie Plugin 
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
jQuery.cookie = function (d, e, b) {
    if (arguments.length > 1 && (e === null || typeof e !== "object")) {
        b = jQuery.extend({}, b);
        if (e === null) {
            b.expires = -1
        }
        if (typeof b.expires === "number") {
            var g = b.expires, c = b.expires = new Date();
            c.setDate(c.getDate() + g)
        }
        return (document.cookie = [encodeURIComponent(d), "=", b.raw ? String(e) : encodeURIComponent(String(e)), b.expires ? "; expires=" + b.expires.toUTCString() : "", b.path ? "; path=" + b.path : "", b.domain ? "; domain=" + b.domain : "", b.secure ? "; secure" : ""].join(""))
    }
    b = e || {};
    var a, f = b.raw ? function (h) {
        return h
    } : decodeURIComponent;
    return (a = new RegExp("(?:^|; )" + encodeURIComponent(d) + "=([^;]*)").exec(document.cookie)) ? f(a[1]) : null
};
/*
 * JQuery URL Parser plugin
 * Developed and maintanined by Mark Perkins, mark@allmarkedup.com
 * Source repository: https://github.com/allmarkedup/jQuery-URL-Parser
 * Licensed under an MIT-style license. See https://github.com/allmarkedup/jQuery-URL-Parser/blob/master/LICENSE for details.
 */
(function (a) {
    if (typeof define === "function" && define.amd) {
        define(["jquery"], a)
    } else {
        a(jQuery)
    }
})(function (h, f) {
    var i = {
        a: "href",
        img: "src",
        form: "action",
        base: "href",
        script: "src",
        iframe: "src",
        link: "href"
    }, j = ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "fragment"], e = {anchor: "fragment"}, a = {
        strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
        loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
    }, c = /(?:^|&|;)([^&=;]*)=?([^&;]*)/g, b = /(?:^|&|;)([^&=;]*)=?([^&;]*)/g;

    function g(k, n) {
        var p = decodeURI(unescape(k)), m = a[n || false ? "strict" : "loose"].exec(p), o = {
            attr: {},
            param: {},
            seg: {}
        }, l = 14;
        while (l--) {
            o.attr[j[l]] = m[l] || ""
        }
        o.param.query = {};
        o.param.fragment = {};
        o.attr.query.replace(c, function (r, q, s) {
            if (q) {
                o.param.query[q] = s
            }
        });
        o.attr.fragment.replace(b, function (r, q, s) {
            if (q) {
                o.param.fragment[q] = s
            }
        });
        o.seg.path = o.attr.path.replace(/^\/+|\/+$/g, "").split("/");
        o.seg.fragment = o.attr.fragment.replace(/^\/+|\/+$/g, "").split("/");
        o.attr.base = o.attr.host ? (o.attr.protocol ? o.attr.protocol + "://" + o.attr.host : o.attr.host) + (o.attr.port ? ":" + o.attr.port : "") : "";
        return o
    }

    function d(l) {
        var k = l.tagName;
        if (k !== f) {
            return i[k.toLowerCase()]
        }
        return k
    }

    h.fn.url = function (l) {
        var k = "";
        if (this.length) {
            k = h(this).attr(d(this[0])) || ""
        }
        return h.url(k, l)
    };
    h.url = function (k, l) {
        if (arguments.length === 1 && k === true) {
            l = true;
            k = f
        }
        l = l || false;
        k = k || window.location.toString();
        return {
            data: g(k, l), attr: function (m) {
                m = e[m] || m;
                return m !== f ? this.data.attr[m] : this.data.attr
            }, param: function (m) {
                return m !== f ? this.data.param.query[m] : this.data.param.query
            }, fparam: function (m) {
                return m !== f ? this.data.param.fragment[m] : this.data.param.fragment
            }, segment: function (m) {
                if (m === f) {
                    return this.data.seg.path
                } else {
                    m = m < 0 ? this.data.seg.path.length + m : m - 1;
                    return this.data.seg.path[m]
                }
            }, fsegment: function (m) {
                if (m === f) {
                    return this.data.seg.fragment
                } else {
                    m = m < 0 ? this.data.seg.fragment.length + m : m - 1;
                    return this.data.seg.fragment[m]
                }
            }
        }
    }
});
/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/ 
 *
 */
jQuery.easing["jswing"] = jQuery.easing["swing"];
jQuery.extend(jQuery.easing, {
    def: "easeOutQuad", swing: function (e, t, n, r, i) {
        return jQuery.easing[jQuery.easing.def](e, t, n, r, i)
    }, easeInQuad: function (e, t, n, r, i) {
        return r * (t /= i) * t + n
    }, easeOutQuad: function (e, t, n, r, i) {
        return -r * (t /= i) * (t - 2) + n
    }, easeInOutQuad: function (e, t, n, r, i) {
        if ((t /= i / 2) < 1)return r / 2 * t * t + n;
        return -r / 2 * (--t * (t - 2) - 1) + n
    }, easeInCubic: function (e, t, n, r, i) {
        return r * (t /= i) * t * t + n
    }, easeOutCubic: function (e, t, n, r, i) {
        return r * ((t = t / i - 1) * t * t + 1) + n
    }, easeInOutCubic: function (e, t, n, r, i) {
        if ((t /= i / 2) < 1)return r / 2 * t * t * t + n;
        return r / 2 * ((t -= 2) * t * t + 2) + n
    }, easeInQuart: function (e, t, n, r, i) {
        return r * (t /= i) * t * t * t + n
    }, easeOutQuart: function (e, t, n, r, i) {
        return -r * ((t = t / i - 1) * t * t * t - 1) + n
    }, easeInOutQuart: function (e, t, n, r, i) {
        if ((t /= i / 2) < 1)return r / 2 * t * t * t * t + n;
        return -r / 2 * ((t -= 2) * t * t * t - 2) + n
    }, easeInQuint: function (e, t, n, r, i) {
        return r * (t /= i) * t * t * t * t + n
    }, easeOutQuint: function (e, t, n, r, i) {
        return r * ((t = t / i - 1) * t * t * t * t + 1) + n
    }, easeInOutQuint: function (e, t, n, r, i) {
        if ((t /= i / 2) < 1)return r / 2 * t * t * t * t * t + n;
        return r / 2 * ((t -= 2) * t * t * t * t + 2) + n
    }, easeInSine: function (e, t, n, r, i) {
        return -r * Math.cos(t / i * (Math.PI / 2)) + r + n
    }, easeOutSine: function (e, t, n, r, i) {
        return r * Math.sin(t / i * (Math.PI / 2)) + n
    }, easeInOutSine: function (e, t, n, r, i) {
        return -r / 2 * (Math.cos(Math.PI * t / i) - 1) + n
    }, easeInExpo: function (e, t, n, r, i) {
        return t == 0 ? n : r * Math.pow(2, 10 * (t / i - 1)) + n
    }, easeOutExpo: function (e, t, n, r, i) {
        return t == i ? n + r : r * (-Math.pow(2, -10 * t / i) + 1) + n
    }, easeInOutExpo: function (e, t, n, r, i) {
        if (t == 0)return n;
        if (t == i)return n + r;
        if ((t /= i / 2) < 1)return r / 2 * Math.pow(2, 10 * (t - 1)) + n;
        return r / 2 * (-Math.pow(2, -10 * --t) + 2) + n
    }, easeInCirc: function (e, t, n, r, i) {
        return -r * (Math.sqrt(1 - (t /= i) * t) - 1) + n
    }, easeOutCirc: function (e, t, n, r, i) {
        return r * Math.sqrt(1 - (t = t / i - 1) * t) + n
    }, easeInOutCirc: function (e, t, n, r, i) {
        if ((t /= i / 2) < 1)return -r / 2 * (Math.sqrt(1 - t * t) - 1) + n;
        return r / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + n
    }, easeInElastic: function (e, t, n, r, i) {
        var s = 1.70158;
        var o = 0;
        var u = r;
        if (t == 0)return n;
        if ((t /= i) == 1)return n + r;
        if (!o)o = i * .3;
        if (u < Math.abs(r)) {
            u = r;
            var s = o / 4
        } else var s = o / (2 * Math.PI) * Math.asin(r / u);
        return -(u * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * i - s) * 2 * Math.PI / o)) + n
    }, easeOutElastic: function (e, t, n, r, i) {
        var s = 1.70158;
        var o = 0;
        var u = r;
        if (t == 0)return n;
        if ((t /= i) == 1)return n + r;
        if (!o)o = i * .3;
        if (u < Math.abs(r)) {
            u = r;
            var s = o / 4
        } else var s = o / (2 * Math.PI) * Math.asin(r / u);
        return u * Math.pow(2, -10 * t) * Math.sin((t * i - s) * 2 * Math.PI / o) + r + n
    }, easeInOutElastic: function (e, t, n, r, i) {
        var s = 1.70158;
        var o = 0;
        var u = r;
        if (t == 0)return n;
        if ((t /= i / 2) == 2)return n + r;
        if (!o)o = i * .3 * 1.5;
        if (u < Math.abs(r)) {
            u = r;
            var s = o / 4
        } else var s = o / (2 * Math.PI) * Math.asin(r / u);
        if (t < 1)return -.5 * u * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * i - s) * 2 * Math.PI / o) + n;
        return u * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * i - s) * 2 * Math.PI / o) * .5 + r + n
    }, easeInBack: function (e, t, n, r, i, s) {
        if (s == undefined)s = 1.70158;
        return r * (t /= i) * t * ((s + 1) * t - s) + n
    }, easeOutBack: function (e, t, n, r, i, s) {
        if (s == undefined)s = 1.70158;
        return r * ((t = t / i - 1) * t * ((s + 1) * t + s) + 1) + n
    }, easeInOutBack: function (e, t, n, r, i, s) {
        if (s == undefined)s = 1.70158;
        if ((t /= i / 2) < 1)return r / 2 * t * t * (((s *= 1.525) + 1) * t - s) + n;
        return r / 2 * ((t -= 2) * t * (((s *= 1.525) + 1) * t + s) + 2) + n
    }, easeInBounce: function (e, t, n, r, i) {
        return r - jQuery.easing.easeOutBounce(e, i - t, 0, r, i) + n
    }, easeOutBounce: function (e, t, n, r, i) {
        if ((t /= i) < 1 / 2.75) {
            return r * 7.5625 * t * t + n
        } else if (t < 2 / 2.75) {
            return r * (7.5625 * (t -= 1.5 / 2.75) * t + .75) + n
        } else if (t < 2.5 / 2.75) {
            return r * (7.5625 * (t -= 2.25 / 2.75) * t + .9375) + n
        } else {
            return r * (7.5625 * (t -= 2.625 / 2.75) * t + .984375) + n
        }
    }, easeInOutBounce: function (e, t, n, r, i) {
        if (t < i / 2)return jQuery.easing.easeInBounce(e, t * 2, 0, r, i) * .5 + n;
        return jQuery.easing.easeOutBounce(e, t * 2 - i, 0, r, i) * .5 + r * .5 + n
    }
})
/*
 * Dialog
 */
function Messi(data, options) {
    var _this = this;
    _this.options = jQuery.extend({}, Messi.prototype.options, options || {});
    _this.messi = jQuery(_this.template);
    _this.setContent(data);
    if (_this.options.title == null) {
        jQuery(".messi-titlebox", _this.messi).remove()
    } else {
        jQuery(".messi-title", _this.messi).append(_this.options.title);
        if (_this.options.buttons.length === 0 || !_this.options.autoclose) {
            if (_this.options.closeButton) {
                var close = jQuery('<a class="messi-closebtn"><i class="wojo icon remove sign"></i></a>');
                close.on("click", function () {
                    _this.hide()
                });
                jQuery(".messi-titlebox", this.messi).prepend(close)
            }
        }
        if (_this.options.titleClass != null) {
            jQuery(".messi-titlebox", this.messi).addClass(_this.options.titleClass)
        }
    }
    if (_this.options.width != null) {
        jQuery(".messi-box", _this.messi).css("width", _this.options.width)
    }
    if (_this.options.buttons.length > 0) {
        for (var i = 0; i < _this.options.buttons.length; i++) {
            var cls = (_this.options.buttons[i]["class"]) ? _this.options.buttons[i]["class"] : "";
            var btn = jQuery('<div class="btnbox"><a class="wojo button mod-button ' + cls + '"> ' + _this.options.buttons[i].label + "</a></div>").data("value", _this.options.buttons[i].val);
            btn.on("click", function () {
                var value = jQuery.data(this, "value");
                var after = (_this.options.callback != null) ? function () {
                    _this.options.callback(value)
                } : null;
                _this.hide(after)
            });
            jQuery(".messi-actions", this.messi).append(btn)
        }
    } else {
        jQuery(".messi-footbox", this.messi).remove()
    }
    _this.modal = (_this.options.modal) ? jQuery('<div class="messi-modal"></div>').css({
        opacity: _this.options.modalOpacity,
        width: jQuery(document).width(),
        height: jQuery(document).height(),
        "z-index": _this.options.zIndex + jQuery(".messi").length
    }).appendTo(document.body) : null;
    if (_this.options.show) {
        _this.show()
    }
    jQuery(window).on("resize", function () {
        _this.resize()
    });
    if (_this.options.autoclose != null) {
        setTimeout(function (_this) {
            _this.hide()
        }, _this.options.autoclose, this)
    }
    return _this
}
Messi.prototype = {
    options: {
        autoclose: null,
        buttons: [],
        callback: null,
        center: true,
        closeButton: true,
        height: "auto",
        title: null,
        titleClass: null,
        modal: false,
        modalOpacity: 0.8,
        show: true,
        unload: true,
        viewport: {top: "0px", left: "0px"},
        width: "",
        zIndex: 7777
    },
    template: '<div class="messi"><div class="messi-box"><div class="messi-wrapper"><div class="messi-titlebox"><span class="messi-title"></span></div><div class="messi-content"></div><div class="messi-footbox clearfix"><div class="messi-actions clearfix"></div></div></div></div></div>',
    content: "<div></div>",
    visible: false,
    setContent: function (data) {
        jQuery(".messi-content", this.messi).css({height: this.options.height}).empty().append(data)
    },
    viewport: function () {
        return {
            top: ((jQuery(window).height() - this.messi.height()) / 2) + jQuery(window).scrollTop() + "px",
            left: ((jQuery(window).width() - this.messi.width()) / 2) + jQuery(window).scrollLeft() + "px"
        }
    },
    show: function () {
        if (this.visible) {
            return
        }
        if (this.options.modal && this.modal != null) {
            this.modal.show()
        }
        this.messi.appendTo(document.body);
        if (this.options.center) {
            this.options.viewport = this.viewport(jQuery(".messi-box", this.messi))
        }
        this.messi.css({
            top: this.options.viewport.top,
            left: this.options.viewport.left,
            "z-index": this.options.zIndex + jQuery(".messi").length
        }).show().animate({opacity: 1}, 300);
        this.visible = true
    },
    hide: function (after) {
        if (!this.visible) {
            return
        }
        var _this = this;
        if (after) {
            after.call()
        }
        this.messi.animate({opacity: 0}, 600, function () {
            if (_this.options.modal && _this.modal != null) {
                _this.modal.remove()
            }
            _this.messi.css({display: "none"}).remove();
            _this.visible = false;
            if (_this.options.unload) {
                _this.unload()
            }
        });
        return this
    },
    resize: function () {
        if (this.options.modal) {
            jQuery(".messi-modal").css({width: jQuery(document).width(), height: jQuery(document).height()})
        }
        if (this.options.center) {
            this.options.viewport = this.viewport(jQuery(".messi-box", this.messi));
            this.messi.css({top: this.options.viewport.top, left: this.options.viewport.left})
        }
    },
    toggle: function () {
        this[this.visible ? "hide" : "show"]();
        return this
    },
    unload: function () {
        if (this.visible) {
            this.hide()
        }
        jQuery(window).off("resize", function () {
            this.resize()
        });
        this.messi.remove()
    }
};
jQuery.extend(Messi, {
    alert: function (data, callback, options) {
        var buttons = [{id: "ok", label: "OK", val: "OK"}];
        options = jQuery.extend({
            closeButton: false, buttons: buttons, callback: function () {
            }
        }, options || {}, {show: true, unload: true, callback: callback});
        return new Messi(data, options)
    }, ask: function (data, callback, options) {
        var buttons = [{id: "yes", label: "Yes", val: "Y", "class": "btn-success"}, {
            id: "no",
            label: "No",
            val: "N",
            "class": "btn-danger"
        }];
        options = jQuery.extend({
            closeButton: false, modal: true, buttons: buttons, callback: function () {
            }
        }, options || {}, {show: true, unload: true, callback: callback});
        return new Messi(data, options)
    }, img: function (src, options) {
        var img = new Image();
        jQuery(img).load(function () {
            var vp = {width: jQuery(window).width() - 50, height: jQuery(window).height() - 50};
            var ratio = (this.width > vp.width || this.height > vp.height) ? Math.min(vp.width / this.width, vp.height / this.height) : 1;
            jQuery(img).css({width: this.width * ratio, height: this.height * ratio});
            options = jQuery.extend(options || {}, {
                show: true,
                unload: true,
                closeButton: true,
                width: this.width * ratio,
                height: this.height * ratio,
                padding: 0
            });
            new Messi(img, options)
        }).error(function () {
            console.log("Error loading " + src)
        }).attr("src", src)
    }, load: function (url, params, options, callback) {
        var buttons = [];
        options = jQuery.extend({closeButton: true, modal: true, buttons: buttons, title: ""}, options || {}, {
            show: true,
            unload: true,
            callback: callback
        });
        var request = {
            type: "post", url: url, data: params, cache: false, error: function (request, status, error) {
                console.log(request.responseText)
            }, success: function (html) {
                new Messi(html, options)
            }
        };
        jQuery.ajax(request)
    }
});
/* http://joequery.github.io/Stupid-Table-Plugin/ */
(function ($) {
    $.fn.tablesort = function (sortFns) {
        return this.each(function () {
            var $table = $(this);
            sortFns = sortFns || {};
            sortFns = $.extend({}, $.fn.tablesort.default_sort_fns, sortFns);
            $table.on("click.tablesort", "th", function () {
                var $this = $(this);
                var th_index = 0;
                var dir = $.fn.tablesort.dir;
                $table.find("th").slice(0, $this.index()).each(function () {
                    var cols = $(this).attr("colspan") || 1;
                    th_index += parseInt(cols, 10);
                });
                var sort_dir = $this.data("sort-default") || dir.ASC;
                if ($this.data("sort-dir"))
                    sort_dir = $this.data("sort-dir") === dir.ASC ? dir.DESC : dir.ASC;
                var type = $this.data("sort") || null;
                if (type === null) {
                    return;
                }
                $table.trigger("beforetablesort", {column: th_index, direction: sort_dir});
                $table.css("display");
                setTimeout(function () {
                    var column = [];
                    var sortMethod = sortFns[type];
                    var trs = $table.children("tbody").children("tr");
                    trs.each(function (index, tr) {
                        var $e = $(tr).children().eq(th_index);
                        var sort_val = $e.data("sort-value");
                        var order_by = typeof(sort_val) !== "undefined" ? sort_val : $e.text();
                        column.push([order_by, tr]);
                    });
                    column.sort(function (a, b) {
                        return sortMethod(a[0], b[0]);
                    });
                    if (sort_dir != dir.ASC)
                        column.reverse();
                    trs = $.map(column, function (kv) {
                        return kv[1];
                    });
                    $table.children("tbody").append(trs);
                    $table.find("th").data("sort-dir", null).removeClass("desc asc");
                    $this.data("sort-dir", sort_dir).addClass(sort_dir);
                    $table.trigger("aftertablesort", {column: th_index, direction: sort_dir});
                    $table.css("display");
                }, 10);
            });
        });
    };
    $.fn.tablesort.dir = {ASC: "asc", DESC: "desc"};
    $.fn.tablesort.default_sort_fns = {
        "int": function (a, b) {
            return parseInt(a, 10) - parseInt(b, 10);
        }, "float": function (a, b) {
            return parseFloat(a) - parseFloat(b);
        }, "string": function (a, b) {
            if (a < b)return -1;
            if (a > b)return +1;
            return 0;
        }, "string-ins": function (a, b) {
            a = a.toLowerCase();
            b = b.toLowerCase();
            if (a < b)return -1;
            if (a > b)return +1;
            return 0;
        }
    };
})(jQuery);
/* Custom File Input 
 * bootstrap-filestyle
 * doc: http://dev.tudosobreweb.com.br/bootstrap-filestyle/
 * github: https://github.com/markusslima/bootstrap-filestyle
 */
(function (c) {
    var b = function (e, d) {
        this.options = d;
        this.$elementFilestyle = [];
        this.$element = c(e)
    };
    b.prototype = {
        clear: function () {
            this.$element.val("");
            this.$elementFilestyle.find(":text").val("");
            this.$elementFilestyle.find(".badge").remove()
        }, destroy: function () {
            this.$element.removeAttr("style").removeData("filestyle").val("");
            this.$elementFilestyle.remove()
        }, disabled: function (d) {
            if (d === true) {
                if (!this.options.disabled) {
                    this.$element.attr("disabled", "true");
                    this.$elementFilestyle.find("label").attr("disabled", "true");
                    this.options.disabled = true
                }
            } else {
                if (d === false) {
                    if (this.options.disabled) {
                        this.$element.removeAttr("disabled");
                        this.$elementFilestyle.find("label").removeAttr("disabled");
                        this.options.disabled = false
                    }
                } else {
                    return this.options.disabled
                }
            }
        }, buttonBefore: function (d) {
            if (d === true) {
                if (!this.options.buttonBefore) {
                    this.options.buttonBefore = true;
                    if (this.options.input) {
                        this.$elementFilestyle.remove();
                        this.constructor();
                        this.pushNameFiles()
                    }
                }
            } else {
                if (d === false) {
                    if (this.options.buttonBefore) {
                        this.options.buttonBefore = false;
                        if (this.options.input) {
                            this.$elementFilestyle.remove();
                            this.constructor();
                            this.pushNameFiles()
                        }
                    }
                } else {
                    return this.options.buttonBefore
                }
            }
        }, icon: function (d) {
            if (d === true) {
                if (!this.options.icon) {
                    this.options.icon = true;
                    this.$elementFilestyle.find("label").prepend(this.htmlIcon())
                }
            } else {
                if (d === false) {
                    if (this.options.icon) {
                        this.options.icon = false;
                        this.$elementFilestyle.find(".glyphicon").remove()
                    }
                } else {
                    return this.options.icon
                }
            }
        }, input: function (e) {
            if (e === true) {
                if (!this.options.input) {
                    this.options.input = true;
                    if (this.options.buttonBefore) {
                        this.$elementFilestyle.append(this.htmlInput())
                    } else {
                        this.$elementFilestyle.prepend(this.htmlInput())
                    }
                    this.$elementFilestyle.find(".badge").remove();
                    this.pushNameFiles();
                    this.$elementFilestyle.find(".group-span-filestyle").addClass("input-group-btn")
                }
            } else {
                if (e === false) {
                    if (this.options.input) {
                        this.options.input = false;
                        this.$elementFilestyle.find(":text").remove();
                        var d = this.pushNameFiles();
                        if (d.length > 0 && this.options.badge) {
                            this.$elementFilestyle.find("label").append(' <span class="badge">' + d.length + "</span>")
                        }
                        this.$elementFilestyle.find(".group-span-filestyle").removeClass("input-group-btn")
                    }
                } else {
                    return this.options.input
                }
            }
        }, size: function (f) {
            if (f !== undefined) {
                var e = this.$elementFilestyle.find("label"), d = this.$elementFilestyle.find("input");
                e.removeClass("btn-lg btn-sm");
                d.removeClass("input-lg input-sm");
                if (f != "nr") {
                    e.addClass("btn-" + f);
                    d.addClass("input-" + f)
                }
            } else {
                return this.options.size
            }
        }, buttonText: function (d) {
            if (d !== undefined) {
                this.options.buttonText = d;
                this.$elementFilestyle.find("label span").html(this.options.buttonText)
            } else {
                return this.options.buttonText
            }
        }, buttonName: function (d) {
            if (d !== undefined) {
                this.options.buttonName = d;
                this.$elementFilestyle.find("label").attr({"class": "btn " + this.options.buttonName})
            } else {
                return this.options.buttonName
            }
        }, iconName: function (d) {
            if (d !== undefined) {
                this.$elementFilestyle.find(".glyphicon").attr({"class": ".glyphicon " + this.options.iconName})
            } else {
                return this.options.iconName
            }
        }, htmlIcon: function () {
            if (this.options.icon) {
                return '<i class="icon open folder"></i> '
            } else {
                return ""
            }
        }, htmlInput: function () {
            if (this.options.input) {
                return '<input disabled="disabled" type="text" class="form-control ' + (this.options.size == "nr" ? "" : "input-" + this.options.size) + '"> '
            } else {
                return ""
            }
        }, pushNameFiles: function () {
            var f = "", e = [];
            if (this.$element[0].files === undefined) {
                e[0] = {name: this.$element[0] && this.$element[0].value}
            } else {
                e = this.$element[0].files
            }
            for (var d = 0; d < e.length; d++) {
                f += e[d].name.split("\\").pop() + ", "
            }
            if (f !== "") {
                this.$elementFilestyle.find(":text").val(f.replace(/\, $/g, ""))
            } else {
                this.$elementFilestyle.find(":text").val("")
            }
            return e
        }, constructor: function () {
            var e = this, g = "", i = e.$element.attr("id"), h = [], f = "", d;
            if (i === "" || !i) {
                i = "filestyle-" + c(".bootstrap-filestyle").length;
                e.$element.attr({id: i})
            }
            f = '<a class="group-span-filestyle ' + (e.options.input ? "input-group-btn" : "") + '"><label for="' + i + '" class="btn ' + e.options.buttonName + " " + (e.options.size == "nr" ? "" : "btn-" + e.options.size) + '" ' + (e.options.disabled ? 'disabled="true"' : "") + ">" + e.htmlIcon() + e.options.buttonText + "</label></a>";
            g = e.options.buttonBefore ? f + e.htmlInput() : e.htmlInput() + f;
            e.$elementFilestyle = c('<div class="fileinput">' + g + "</div>");
            e.$elementFilestyle.find(".group-span-filestyle").attr("tabindex", "0").keypress(function (j) {
                if (j.keyCode === 13 || j.charCode === 32) {
                    e.$elementFilestyle.find("label").click();
                    return false
                }
            });
            e.$element.css({
                position: "absolute",
                clip: "rect(0px 0px 0px 0px)"
            }).attr("tabindex", "-1").after(e.$elementFilestyle);
            if (e.options.disabled) {
                e.$element.attr("disabled", "true")
            }
            e.$element.change(function () {
                var j = e.pushNameFiles();
                if (e.options.input == false && e.options.badge) {
                    if (e.$elementFilestyle.find(".badge").length == 0) {
                        e.$elementFilestyle.find("label").append(' <span class="badge">' + j.length + "</span>")
                    } else {
                        if (j.length == 0) {
                            e.$elementFilestyle.find(".badge").remove()
                        } else {
                            e.$elementFilestyle.find(".badge").html(j.length)
                        }
                    }
                } else {
                    e.$elementFilestyle.find(".badge").remove()
                }
            });
            if (window.navigator.userAgent.search(/firefox/i) > -1) {
                e.$elementFilestyle.find("label").click(function () {
                    e.$element.click();
                    return false
                })
            }
        }
    };
    var a = c.fn.filestyle;
    c.fn.filestyle = function (f, g) {
        var d = "", e = this.each(function () {
            if (c(this).attr("type") === "file") {
                var j = c(this), i = j.data("filestyle"), h = c.extend({}, c.fn.filestyle.defaults, f, typeof f === "object" && f);
                if (!i) {
                    j.data("filestyle", (i = new b(this, h)));
                    i.constructor()
                }
                if (typeof f === "string") {
                    d = i[f](g)
                }
            }
        });
        if (typeof d !== undefined) {
            return d
        } else {
            return e
        }
    };
    c.fn.filestyle.defaults = {
        buttonText: "Choose file",
        iconName: "glyphicon-folder-open",
        buttonName: "btn-default",
        size: "nr",
        input: true,
        badge: true,
        icon: true,
        buttonBefore: false,
        disabled: false
    };
    c.fn.filestyle.noConflict = function () {
        c.fn.filestyle = a;
        return this
    };
    c(function () {
        c(".filestyle").each(function () {
            var e = c(this), d = {
                input: e.attr("data-input") === "false" ? false : true,
                icon: e.attr("data-icon") === "false" ? false : true,
                buttonBefore: e.attr("data-buttonBefore") === "true" ? true : false,
                disabled: e.attr("data-disabled") === "true" ? true : false,
                size: e.attr("data-size"),
                buttonText: e.attr("data-buttonText"),
                buttonName: e.attr("data-buttonName"),
                iconName: e.attr("data-iconName"),
                badge: e.attr("data-badge") === "false" ? false : true
            };
            e.filestyle(d)
        })
    })
})(window.jQuery);
/*!
 * pickadate.js v3.3.0, 2013/10/13
 * By Amsul, http://amsul.ca
 * Hosted on http://amsul.github.io/pickadate.js
 * Licensed under MIT
 */
!function (a) {
    "function" == typeof define && define.amd ? define("picker", ["jquery"], a) : this.Picker = a(jQuery)
}(function (a) {
    function b(d, e, f, g) {
        function h() {
            return b._.node("div", b._.node("div", b._.node("div", b._.node("div", o.component.nodes(j.open), l.box), l.wrap), l.frame), l.holder)
        }

        function i(a) {
            a.stopPropagation(), "focus" == a.type && o.$root.addClass(l.focused), o.open()
        }

        if (!d)return b;
        var j = {id: Math.abs(~~(1e9 * Math.random()))}, k = f ? a.extend(!0, {}, f.defaults, g) : g || {}, l = a.extend({}, b.klasses(), k.klass), m = a(d), n = function () {
            return this.start()
        }, o = n.prototype = {
            constructor: n, $node: m, start: function () {
                return j && j.start ? o : (j.methods = {}, j.start = !0, j.open = !1, j.type = d.type, d.autofocus = d == document.activeElement, d.type = "text", d.readOnly = !0, o.component = new f(o, k), o.$root = a(b._.node("div", h(), l.picker)).on({
                    focusin: function (a) {
                        o.$root.removeClass(l.focused), a.stopPropagation()
                    }, "mousedown click": function (a) {
                        a.target != o.$root.children()[0] && a.stopPropagation()
                    }
                }).on("click", "[data-pick], [data-nav], [data-clear]", function () {
                    var c = a(this), e = c.data(), f = c.hasClass(l.navDisabled) || c.hasClass(l.disabled), g = document.activeElement;
                    g = g && (g.type || g.href), (f || !a.contains(o.$root[0], g)) && d.focus(), e.nav && !f ? o.set("highlight", o.component.item.highlight, {nav: e.nav}) : b._.isInteger(e.pick) && !f ? o.set("select", e.pick).close(!0) : e.clear && o.clear().close(!0)
                }), k.formatSubmit && (o._hidden = a('<input type=hidden name="' + ("string" == typeof k.hiddenPrefix ? k.hiddenPrefix : "") + d.name + ("string" == typeof k.hiddenSuffix ? k.hiddenSuffix : "_submit") + '"' + (m.data("value") ? ' value="' + b._.trigger(o.component.formats.toString, o.component, [k.formatSubmit, o.component.item.select]) + '"' : "") + ">")[0]), m.addClass(l.input).on("focus.P" + j.id + " click.P" + j.id, i).on("change.P" + j.id, function () {
                    o._hidden && (o._hidden.value = d.value ? b._.trigger(o.component.formats.toString, o.component, [k.formatSubmit, o.component.item.select]) : "")
                }).on("keydown.P" + j.id, function (a) {
                    var b = a.keyCode, c = /^(8|46)$/.test(b);
                    return 27 == b ? (o.close(), !1) : ((32 == b || c || !j.open && o.component.key[b]) && (a.preventDefault(), a.stopPropagation(), c ? o.clear().close() : o.open()), void 0)
                }).val(m.data("value") ? b._.trigger(o.component.formats.toString, o.component, [k.format, o.component.item.select]) : d.value).after(o._hidden).data(e, o), k.container ? a(k.container).append(o.$root) : m.after(o.$root), o.on({
                    start: o.component.onStart,
                    render: o.component.onRender,
                    stop: o.component.onStop,
                    open: o.component.onOpen,
                    close: o.component.onClose,
                    set: o.component.onSet
                }).on({
                    start: k.onStart,
                    render: k.onRender,
                    stop: k.onStop,
                    open: k.onOpen,
                    close: k.onClose,
                    set: k.onSet
                }), d.autofocus && o.open(), o.trigger("start").trigger("render"))
            }, render: function (a) {
                return a ? o.$root.html(h()) : o.$root.find("." + l.box).html(o.component.nodes(j.open)), o.trigger("render")
            }, stop: function () {
                return j.start ? (o.close(), o._hidden && o._hidden.parentNode.removeChild(o._hidden), o.$root.remove(), m.removeClass(l.input).off(".P" + j.id).removeData(e), d.type = j.type, d.readOnly = !1, o.trigger("stop"), j.methods = {}, j.start = !1, o) : o
            }, open: function (e) {
                return j.open ? o : (m.addClass(l.active), o.$root.addClass(l.opened), e !== !1 && (j.open = !0, m.trigger("focus"), c.on("click.P" + j.id + " focusin.P" + j.id, function (a) {
                    a.target != d && a.target != document && o.close()
                }).on("keydown.P" + j.id, function (c) {
                    var e = c.keyCode, f = o.component.key[e], g = c.target;
                    27 == e ? o.close(!0) : g != d || !f && 13 != e ? a.contains(o.$root[0], g) && 13 == e && (c.preventDefault(), g.click()) : (c.preventDefault(), f ? b._.trigger(o.component.key.go, o, [b._.trigger(f)]) : o.$root.find("." + l.highlighted).hasClass(l.disabled) || o.set("select", o.component.item.highlight).close())
                })), o.trigger("open"))
            }, close: function (a) {
                return a && (m.off("focus.P" + j.id).trigger("focus"), setTimeout(function () {
                    m.on("focus.P" + j.id, i)
                }, 0)), m.removeClass(l.active), o.$root.removeClass(l.opened + " " + l.focused), j.open && (j.open = !1, c.off(".P" + j.id)), o.trigger("close")
            }, clear: function () {
                return o.set("clear")
            }, set: function (a, c, d) {
                var e, f, g = b._.isObject(a), h = g ? a : {};
                if (a) {
                    g || (h[a] = c);
                    for (e in h)f = h[e], o.component.item[e] && o.component.set(e, f, d || {}), ("select" == e || "clear" == e) && m.val("clear" == e ? "" : b._.trigger(o.component.formats.toString, o.component, [k.format, o.component.get(e)])).trigger("change");
                    o.render()
                }
                return o.trigger("set", h)
            }, get: function (a, c) {
                return a = a || "value", null != j[a] ? j[a] : "value" == a ? d.value : o.component.item[a] ? "string" == typeof c ? b._.trigger(o.component.formats.toString, o.component, [c, o.component.get(a)]) : o.component.get(a) : void 0
            }, on: function (a, c) {
                var d, e, f = b._.isObject(a), g = f ? a : {};
                if (a) {
                    f || (g[a] = c);
                    for (d in g)e = g[d], j.methods[d] = j.methods[d] || [], j.methods[d].push(e)
                }
                return o
            }, trigger: function (a, c) {
                var d = j.methods[a];
                return d && d.map(function (a) {
                    b._.trigger(a, o, [c])
                }), o
            }
        };
        return new n
    }

    var c = a(document);
    return b.klasses = function (a) {
        return a = a || "picker", {
            picker: a,
            opened: a + "--opened",
            focused: a + "--focused",
            input: a + "__input",
            active: a + "__input--active",
            holder: a + "__holder",
            frame: a + "__frame",
            wrap: a + "__wrap",
            box: a + "__box"
        }
    }, b._ = {
        group: function (a) {
            for (var c, d = "", e = b._.trigger(a.min, a); e <= b._.trigger(a.max, a, [e]); e += a.i)c = b._.trigger(a.item, a, [e]), d += b._.node(a.node, c[0], c[1], c[2]);
            return d
        }, node: function (b, c, d, e) {
            return c ? (c = a.isArray(c) ? c.join("") : c, d = d ? ' class="' + d + '"' : "", e = e ? " " + e : "", "<" + b + d + e + ">" + c + "</" + b + ">") : ""
        }, lead: function (a) {
            return (10 > a ? "0" : "") + a
        }, trigger: function (a, b, c) {
            return "function" == typeof a ? a.apply(b, c || []) : a
        }, digits: function (a) {
            return /\d/.test(a[1]) ? 2 : 1
        }, isObject: function (a) {
            return {}.toString.call(a).indexOf("Object") > -1
        }, isDate: function (a) {
            return {}.toString.call(a).indexOf("Date") > -1 && this.isInteger(a.getDate())
        }, isInteger: function (a) {
            return {}.toString.call(a).indexOf("Number") > -1 && 0 === a % 1
        }
    }, b.extend = function (c, d) {
        a.fn[c] = function (e, f) {
            var g = this.data(c);
            return "picker" == e ? g : g && "string" == typeof e ? (b._.trigger(g[e], g, [f]), this) : this.each(function () {
                var f = a(this);
                f.data(c) || new b(this, c, d, e)
            })
        }, a.fn[c].defaults = d.defaults
    }, b
});
/*!
 * Date picker for pickadate.js v3.3.0
 * http://amsul.github.io/pickadate.js/date.htm
 */
!function (a) {
    "function" == typeof define && define.amd ? define(["picker", "jquery"], a) : a(Picker, jQuery)
}(function (a, b) {
    function c(a, b) {
        var c = this, d = a.$node[0].value, e = a.$node.data("value"), f = e || d, g = e ? b.formatSubmit : b.format, h = function () {
            return "rtl" === getComputedStyle(a.$root[0]).direction
        };
        c.settings = b, c.queue = {
            min: "measure create",
            max: "measure create",
            now: "now create",
            select: "parse create validate",
            highlight: "navigate create validate",
            view: "create validate viewset",
            disable: "flipItem",
            enable: "flipItem"
        }, c.item = {}, c.item.disable = (b.disable || []).slice(0), c.item.enable = -function (a) {
            return a[0] === !0 ? a.shift() : -1
        }(c.item.disable), c.set("min", b.min).set("max", b.max).set("now").set("select", f || c.item.now, {
            format: g,
            data: function (a) {
                return f && (a.indexOf("mm") > -1 || a.indexOf("m") > -1)
            }(c.formats.toArray(g))
        }), c.key = {
            40: 7, 38: -7, 39: function () {
                return h() ? -1 : 1
            }, 37: function () {
                return h() ? 1 : -1
            }, go: function (a) {
                c.set("highlight", [c.item.highlight.year, c.item.highlight.month, c.item.highlight.date + a], {interval: a}), this.render()
            }
        }, a.on("render", function () {
            a.$root.find("." + b.klass.selectMonth).on("change", function () {
                a.set("highlight", [a.get("view").year, this.value, a.get("highlight").date]), a.$root.find("." + b.klass.selectMonth).trigger("focus")
            }), a.$root.find("." + b.klass.selectYear).on("change", function () {
                a.set("highlight", [this.value, a.get("view").month, a.get("highlight").date]), a.$root.find("." + b.klass.selectYear).trigger("focus")
            })
        }).on("open", function () {
            a.$root.find("button, select").attr("disabled", !1)
        }).on("close", function () {
            a.$root.find("button, select").attr("disabled", !0)
        })
    }

    var d = 7, e = 6;
    c.prototype.set = function (a, b, c) {
        var d = this;
        return d.item["enable" == a ? "disable" : "flip" == a ? "enable" : a] = d.queue[a].split(" ").map(function (e) {
            return b = d[e](a, b, c)
        }).pop(), "select" == a ? d.set("highlight", d.item.select, c) : "highlight" == a ? d.set("view", d.item.highlight, c) : ("flip" == a || "min" == a || "max" == a || "disable" == a || "enable" == a) && d.item.select && d.item.highlight && d.set("select", d.item.select, c).set("highlight", d.item.highlight, c), d
    }, c.prototype.get = function (a) {
        return this.item[a]
    }, c.prototype.create = function (c, d, e) {
        var f, g = this;
        return d = void 0 === d ? c : d, d == -1 / 0 || 1 / 0 == d ? f = d : a._.isObject(d) && a._.isInteger(d.pick) ? d = d.obj : b.isArray(d) ? (d = new Date(d[0], d[1], d[2]), d = a._.isDate(d) ? d : g.create().obj) : d = a._.isInteger(d) || a._.isDate(d) ? g.normalize(new Date(d), e) : g.now(c, d, e), {
            year: f || d.getFullYear(),
            month: f || d.getMonth(),
            date: f || d.getDate(),
            day: f || d.getDay(),
            obj: f || d,
            pick: f || d.getTime()
        }
    }, c.prototype.now = function (a, b, c) {
        return b = new Date, c && c.rel && b.setDate(b.getDate() + c.rel), this.normalize(b, c)
    }, c.prototype.navigate = function (b, c, d) {
        if (a._.isObject(c)) {
            for (var e = new Date(c.year, c.month + (d && d.nav ? d.nav : 0), 1), f = e.getFullYear(), g = e.getMonth(), h = c.date; a._.isDate(e) && new Date(f, g, h).getMonth() !== g;)h -= 1;
            c = [f, g, h]
        }
        return c
    }, c.prototype.normalize = function (a) {
        return a.setHours(0, 0, 0, 0), a
    }, c.prototype.measure = function (b, c) {
        var d = this;
        return c ? a._.isInteger(c) && (c = d.now(b, c, {rel: c})) : c = "min" == b ? -1 / 0 : 1 / 0, c
    }, c.prototype.viewset = function (a, b) {
        return this.create([b.year, b.month, 1])
    }, c.prototype.validate = function (c, d, e) {
        var f, g, h, i, j = this, k = d, l = e && e.interval ? e.interval : 1, m = -1 === j.item.enable, n = j.item.min, o = j.item.max, p = m && j.item.disable.filter(function (c) {
                if (b.isArray(c)) {
                    var e = j.create(c).pick;
                    e < d.pick ? f = !0 : e > d.pick && (g = !0)
                }
                return a._.isInteger(c)
            }).length;
        if (!e.nav && (!m && j.disabled(d) || m && j.disabled(d) && (p || f || g) || d.pick <= n.pick || d.pick >= o.pick))for (m && !p && (!g && l > 0 || !f && 0 > l) && (l *= -1); j.disabled(d) && (Math.abs(l) > 1 && (d.month < k.month || d.month > k.month) && (d = k, l = Math.abs(l) / l), d.pick <= n.pick ? (h = !0, l = 1) : d.pick >= o.pick && (i = !0, l = -1), !h || !i);)d = j.create([d.year, d.month, d.date + l]);
        return d
    }, c.prototype.disabled = function (c) {
        var d = this, e = !!d.item.disable.filter(function (e) {
            return a._.isInteger(e) ? c.day === (d.settings.firstDay ? e : e - 1) % 7 : b.isArray(e) || a._.isDate(e) ? c.pick === d.create(e).pick : void 0
        }).length;
        return -1 === d.item.enable ? !e : e || c.pick < d.item.min.pick || c.pick > d.item.max.pick
    }, c.prototype.parse = function (c, d, e) {
        var f = this, g = {};
        if (!d || a._.isInteger(d) || b.isArray(d) || a._.isDate(d) || a._.isObject(d) && a._.isInteger(d.pick))return d;
        if (!e || !e.format)throw"Need a formatting option to parse this..";
        return f.formats.toArray(e.format).map(function (b) {
            var c = f.formats[b], e = c ? a._.trigger(c, f, [d, g]) : b.replace(/^!/, "").length;
            c && (g[b] = d.substr(0, e)), d = d.substr(e)
        }), [g.yyyy || g.yy, +(g.mm || g.m) - (e.data ? 1 : 0), g.dd || g.d]
    }, c.prototype.formats = function () {
        function b(a, b, c) {
            var d = a.match(/\w+/)[0];
            return c.mm || c.m || (c.m = b.indexOf(d)), d.length
        }

        function c(a) {
            return a.match(/\w+/)[0].length
        }

        return {
            d: function (b, c) {
                return b ? a._.digits(b) : c.date
            }, dd: function (b, c) {
                return b ? 2 : a._.lead(c.date)
            }, ddd: function (a, b) {
                return a ? c(a) : this.settings.weekdaysShort[b.day]
            }, dddd: function (a, b) {
                return a ? c(a) : this.settings.weekdaysFull[b.day]
            }, m: function (b, c) {
                return b ? a._.digits(b) : c.month + 1
            }, mm: function (b, c) {
                return b ? 2 : a._.lead(c.month + 1)
            }, mmm: function (a, c) {
                var d = this.settings.monthsShort;
                return a ? b(a, d, c) : d[c.month]
            }, mmmm: function (a, c) {
                var d = this.settings.monthsFull;
                return a ? b(a, d, c) : d[c.month]
            }, yy: function (a, b) {
                return a ? 2 : ("" + b.year).slice(2)
            }, yyyy: function (a, b) {
                return a ? 4 : b.year
            }, toArray: function (a) {
                return a.split(/(d{1,4}|m{1,4}|y{4}|yy|!.)/g)
            }, toString: function (b, c) {
                var d = this;
                return d.formats.toArray(b).map(function (b) {
                    return a._.trigger(d.formats[b], d, [0, c]) || b.replace(/^!/, "")
                }).join("")
            }
        }
    }(), c.prototype.flipItem = function (a, c) {
        var d = this, e = d.item.disable, f = -1 === d.item.enable;
        return "flip" == c ? d.item.enable = f ? 1 : -1 : "enable" == a && c === !0 || "disable" == a && c === !1 ? (d.item.enable = 1, e = []) : "enable" == a && c === !1 || "disable" == a && c === !0 ? (d.item.enable = -1, e = []) : b.isArray(c) && (!f && "enable" == a || f && "disable" == a ? e = d.removeDisabled(e, c) : (!f && "disable" == a || f && "enable" == a) && (e = d.addDisabled(e, c))), e
    }, c.prototype.addDisabled = function (a, b) {
        var c = this;
        return b.map(function (b) {
            c.filterDisabled(a, b).length || a.push(b)
        }), a
    }, c.prototype.removeDisabled = function (a, b) {
        var c = this;
        return b.map(function (b) {
            a = c.filterDisabled(a, b, 1)
        }), a
    }, c.prototype.filterDisabled = function (c, d, e) {
        var f = this, g = b.isArray(d) || a._.isDate(d), h = g && f.create(d).pick;
        return c.filter(function (c) {
            var i = g && (b.isArray(c) || a._.isDate(c)) ? h === f.create(c).pick : d === c;
            return e ? !i : i
        })
    }, c.prototype.nodes = function (b) {
        var c = this, f = c.settings, g = c.item.now, h = c.item.select, i = c.item.highlight, j = c.item.view, k = c.item.disable, l = c.item.min, m = c.item.max, n = function (b) {
            return f.firstDay && b.push(b.shift()), a._.node("thead", a._.group({
                min: 0,
                max: d - 1,
                i: 1,
                node: "th",
                item: function (a) {
                    return [b[a], f.klass.weekdays]
                }
            }))
        }((f.showWeekdaysFull ? f.weekdaysFull : f.weekdaysShort).slice(0)), o = function (b) {
            return a._.node("div", " ", f.klass["nav" + (b ? "Next" : "Prev")] + (b && j.year >= m.year && j.month >= m.month || !b && j.year <= l.year && j.month <= l.month ? " " + f.klass.navDisabled : ""), "data-nav=" + (b || -1))
        }, p = function (c) {
            return f.selectMonths ? a._.node("select", a._.group({
                min: 0,
                max: 11,
                i: 1,
                node: "option",
                item: function (a) {
                    return [c[a], 0, "value=" + a + (j.month == a ? " selected" : "") + (j.year == l.year && a < l.month || j.year == m.year && a > m.month ? " disabled" : "")]
                }
            }), f.klass.selectMonth, b ? "" : "disabled") : a._.node("div", c[j.month], f.klass.month)
        }, q = function () {
            var c = j.year, d = f.selectYears === !0 ? 5 : ~~(f.selectYears / 2);
            if (d) {
                var e = l.year, g = m.year, h = c - d, i = c + d;
                if (e > h && (i += e - h, h = e), i > g) {
                    var k = h - e, n = i - g;
                    h -= k > n ? n : k, i = g
                }
                return a._.node("select", a._.group({
                    min: h, max: i, i: 1, node: "option", item: function (a) {
                        return [a, 0, "value=" + a + (c == a ? " selected" : "")]
                    }
                }), f.klass.selectYear, b ? "" : "disabled")
            }
            return a._.node("div", c, f.klass.year)
        };
        return a._.node("div", o() + o(1) + p(f.showMonthsShort ? f.monthsShort : f.monthsFull) + q(), f.klass.header) + a._.node("table", n + a._.node("tbody", a._.group({
                    min: 0,
                    max: e - 1,
                    i: 1,
                    node: "tr",
                    item: function (b) {
                        var e = f.firstDay && 0 === c.create([j.year, j.month, 1]).day ? -7 : 0;
                        return [a._.group({
                            min: d * b - j.day + e + 1, max: function () {
                                return this.min + d - 1
                            }, i: 1, node: "td", item: function (b) {
                                return b = c.create([j.year, j.month, b + (f.firstDay ? 1 : 0)]), [a._.node("div", b.date, function (a) {
                                    return a.push(j.month == b.month ? f.klass.infocus : f.klass.outfocus), g.pick == b.pick && a.push(f.klass.now), h && h.pick == b.pick && a.push(f.klass.selected), i && i.pick == b.pick && a.push(f.klass.highlighted), (k && c.disabled(b) || b.pick < l.pick || b.pick > m.pick) && a.push(f.klass.disabled), a.join(" ")
                                }([f.klass.day]), "data-pick=" + b.pick)]
                            }
                        })]
                    }
                })), f.klass.table) + a._.node("div", a._.node("button", f.today, f.klass.buttonToday, "type=button data-pick=" + g.pick + (b ? "" : " disabled")) + a._.node("button", f.clear, f.klass.buttonClear, "type=button data-clear=1" + (b ? "" : " disabled")), f.klass.footer)
    }, c.defaults = function (a) {
        return {
            monthsFull: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            weekdaysFull: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
            weekdaysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
            today: "Today",
            clear: "Clear",
            format: "d mmmm, yyyy",
            klass: {
                table: a + "table",
                header: a + "header",
                navPrev: a + "nav--prev",
                navNext: a + "nav--next",
                navDisabled: a + "nav--disabled",
                month: a + "month",
                year: a + "year",
                selectMonth: a + "select--month",
                selectYear: a + "select--year",
                weekdays: a + "weekday",
                day: a + "day",
                disabled: a + "day--disabled",
                selected: a + "day--selected",
                highlighted: a + "day--highlighted",
                now: a + "day--today",
                infocus: a + "day--infocus",
                outfocus: a + "day--outfocus",
                footer: a + "footer",
                buttonClear: a + "button--clear",
                buttonToday: a + "button--today"
            }
        }
    }(a.klasses().picker + "__"), a.extend("pickadate", c)
});
/*!
 * Time picker for pickadate.js v3.3.0
 * http://amsul.github.io/pickadate.js/time.htm
 */
!function (a) {
    "function" == typeof define && define.amd ? define(["picker", "jquery"], a) : a(Picker, jQuery)
}(function (a, b) {
    function c(a, b) {
        var c = this, d = a.$node.data("value");
        c.settings = b, c.queue = {
            interval: "i",
            min: "measure create",
            max: "measure create",
            now: "now create",
            select: "parse create validate",
            highlight: "create validate",
            view: "create validate",
            disable: "flipItem",
            enable: "flipItem"
        }, c.item = {}, c.item.interval = b.interval || 30, c.item.disable = (b.disable || []).slice(0), c.item.enable = -function (a) {
            return a[0] === !0 ? a.shift() : -1
        }(c.item.disable), c.set("min", b.min).set("max", b.max).set("now").set("select", d || a.$node[0].value || c.item.min, {format: d ? b.formatSubmit : b.format}), c.key = {
            40: 1,
            38: -1,
            39: 1,
            37: -1,
            go: function (a) {
                c.set("highlight", c.item.highlight.pick + a * c.item.interval, {interval: a * c.item.interval}), this.render()
            }
        }, a.on("render", function () {
            var c = a.$root.children(), d = c.find("." + b.klass.viewset);
            d.length && (c[0].scrollTop += d.position().top - 2 * d[0].clientHeight)
        }).on("open", function () {
            a.$root.find("button").attr("disable", !1)
        }).on("close", function () {
            a.$root.find("button").attr("disable", !0)
        })
    }

    var d = 24, e = 60, f = 12, g = d * e;
    c.prototype.set = function (a, b, c) {
        var d = this;
        return d.item["enable" == a ? "disable" : "flip" == a ? "enable" : a] = d.queue[a].split(" ").map(function (e) {
            return b = d[e](a, b, c)
        }).pop(), "select" == a ? d.set("highlight", d.item.select, c) : "highlight" == a ? d.set("view", d.item.highlight, c) : "interval" == a ? d.set("min", d.item.min, c).set("max", d.item.max, c) : ("flip" == a || "min" == a || "max" == a || "disable" == a || "enable" == a) && d.item.select && d.item.highlight && ("min" == a && d.set("max", d.item.max, c), d.set("select", d.item.select, c).set("highlight", d.item.highlight, c)), d
    }, c.prototype.get = function (a) {
        return this.item[a]
    }, c.prototype.create = function (c, f, h) {
        var i = this;
        return f = void 0 === f ? c : f, a._.isObject(f) && a._.isInteger(f.pick) ? f = f.pick : b.isArray(f) ? f = +f[0] * e + +f[1] : a._.isInteger(f) || (f = i.now(c, f, h)), "max" == c && f < i.item.min.pick && (f += g), f = i.normalize(c, f, h), {
            hour: ~~(d + f / e) % d,
            mins: (e + f % e) % e,
            time: (g + f) % g,
            pick: f
        }
    }, c.prototype.now = function (b, c) {
        var d = new Date, f = d.getHours() * e + d.getMinutes();
        return a._.isInteger(c) ? c += "min" == b && 0 > c && 0 === f ? 2 : 1 : c = 1, c * this.item.interval + f
    }, c.prototype.normalize = function (a, b) {
        var c = this.item.min, d = this.item.interval, e = "min" != a || c ? (b - c.pick) % d : 0;
        return b - (e + (0 > b ? d : 0))
    }, c.prototype.measure = function (b, c, f) {
        var g = this;
        return c ? c === !0 || a._.isInteger(c) ? c = g.now(b, c, f) : a._.isObject(c) && a._.isInteger(c.pick) && (c = g.normalize(b, c.pick, f)) : c = "min" == b ? [0, 0] : [d - 1, e - 1], c
    }, c.prototype.validate = function (a, b, c) {
        var d = this, e = c && c.interval ? c.interval : d.item.interval;
        return d.disabled(b) && (b = d.shift(b, e)), b = d.scope(b), d.disabled(b) && (b = d.shift(b, -1 * e)), b
    }, c.prototype.disabled = function (c) {
        var d = this, e = d.item.disable.filter(function (e) {
            return a._.isInteger(e) ? c.hour == e : b.isArray(e) ? c.pick == d.create(e).pick : void 0
        }).length;
        return -1 === d.item.enable ? !e : e
    }, c.prototype.shift = function (a, b) {
        var c = this, d = c.item.min.pick, e = c.item.max.pick;
        for (b = b || c.item.interval; c.disabled(a) && (a = c.create(a.pick += b), !(a.pick <= d || a.pick >= e)););
        return a
    }, c.prototype.scope = function (a) {
        var b = this.item.min.pick, c = this.item.max.pick;
        return this.create(a.pick > c ? c : a.pick < b ? b : a)
    }, c.prototype.parse = function (c, d, f) {
        var g = this, h = {};
        if (!d || a._.isInteger(d) || b.isArray(d) || a._.isDate(d) || a._.isObject(d) && a._.isInteger(d.pick))return d;
        if (!f || !f.format)throw"Need a formatting option to parse this..";
        return g.formats.toArray(f.format).map(function (b) {
            var c = g.formats[b], e = c ? a._.trigger(c, g, [d, h]) : b.replace(/^!/, "").length;
            c && (h[b] = d.substr(0, e)), d = d.substr(e)
        }), +h.i + e * (+(h.H || h.HH) || +(h.h || h.hh) % 12 + (/^p/i.test(h.A || h.a) ? 12 : 0))
    }, c.prototype.formats = {
        h: function (b, c) {
            return b ? a._.digits(b) : c.hour % f || f
        }, hh: function (b, c) {
            return b ? 2 : a._.lead(c.hour % f || f)
        }, H: function (b, c) {
            return b ? a._.digits(b) : "" + c.hour % 24
        }, HH: function (b, c) {
            return b ? a._.digits(b) : a._.lead(c.hour % 24)
        }, i: function (b, c) {
            return b ? 2 : a._.lead(c.mins)
        }, a: function (a, b) {
            return a ? 4 : g / 2 > b.time % g ? "a.m." : "p.m."
        }, A: function (a, b) {
            return a ? 2 : g / 2 > b.time % g ? "AM" : "PM"
        }, toArray: function (a) {
            return a.split(/(h{1,2}|H{1,2}|i|a|A|!.)/g)
        }, toString: function (b, c) {
            var d = this;
            return d.formats.toArray(b).map(function (b) {
                return a._.trigger(d.formats[b], d, [0, c]) || b.replace(/^!/, "")
            }).join("")
        }
    }, c.prototype.flipItem = function (a, c) {
        var d = this, e = d.item.disable, f = -1 === d.item.enable;
        return "flip" == c ? d.item.enable = f ? 1 : -1 : "enable" == a && c === !0 || "disable" == a && c === !1 ? (d.item.enable = 1, e = []) : "enable" == a && c === !1 || "disable" == a && c === !0 ? (d.item.enable = -1, e = []) : b.isArray(c) && (!f && "enable" == a || f && "disable" == a ? e = d.removeDisabled(e, c) : (!f && "disable" == a || f && "enable" == a) && (e = d.addDisabled(e, c))), e
    }, c.prototype.addDisabled = function (a, b) {
        var c = this;
        return b === !1 ? a = [] : b.map(function (b) {
            c.filterDisabled(a, b).length || a.push(b)
        }), a
    }, c.prototype.removeDisabled = function (a, b) {
        var c = this;
        return b.map(function (b) {
            a = c.filterDisabled(a, b, 1)
        }), a
    }, c.prototype.filterDisabled = function (a, c, d) {
        var e = b.isArray(c);
        return a.filter(function (a) {
            var f = !e && c === a || e && b.isArray(a) && c.toString() === a.toString();
            return d ? !f : f
        })
    }, c.prototype.i = function (b, c) {
        return a._.isInteger(c) && c > 0 ? c : this.item.interval
    }, c.prototype.nodes = function (b) {
        var c = this, d = c.settings, e = c.item.select, f = c.item.highlight, g = c.item.view, h = c.item.disable;
        return a._.node("ul", a._.group({
                min: c.item.min.pick,
                max: c.item.max.pick,
                i: c.item.interval,
                node: "li",
                item: function (b) {
                    return b = c.create(b), [a._.trigger(c.formats.toString, c, [a._.trigger(d.formatLabel, c, [b]) || d.format, b]), function (a, i) {
                        return e && e.pick == i && a.push(d.klass.selected), f && f.pick == i && a.push(d.klass.highlighted), g && g.pick == i && a.push(d.klass.viewset), h && c.disabled(b) && a.push(d.klass.disabled), a.join(" ")
                    }([d.klass.listItem], b.pick), "data-pick=" + b.pick]
                }
            }) + a._.node("li", a._.node("button", d.clear, d.klass.buttonClear, "type=button data-clear=1" + (b ? "" : " disable"))), d.klass.list)
    }, c.defaults = function (a) {
        return {
            clear: "Clear",
            format: "h:i A",
            interval: 30,
            klass: {
                picker: a + " " + a + "--time",
                holder: a + "__holder",
                list: a + "__list",
                listItem: a + "__list-item",
                disabled: a + "__list-item--disabled",
                selected: a + "__list-item--selected",
                highlighted: a + "__list-item--highlighted",
                viewset: a + "__list-item--viewset",
                now: a + "__list-item--now",
                buttonClear: a + "__button--clear"
            }
        }
    }(a.klasses().picker), a.extend("pickatime", c)
});
/* Chosen */
!function () {
    var a, AbstractChosen, Chosen, SelectParser, b, c = {}.hasOwnProperty, d = function (a, b) {
        function d() {
            this.constructor = a
        }

        for (var e in b)c.call(b, e) && (a[e] = b[e]);
        return d.prototype = b.prototype, a.prototype = new d, a.__super__ = b.prototype, a
    };
    SelectParser = function () {
        function SelectParser() {
            this.options_index = 0, this.parsed = []
        }

        return SelectParser.prototype.add_node = function (a) {
            return "OPTGROUP" === a.nodeName.toUpperCase() ? this.add_group(a) : this.add_option(a)
        }, SelectParser.prototype.add_group = function (a) {
            var b, c, d, e, f, g;
            for (b = this.parsed.length, this.parsed.push({
                array_index: b,
                group: !0,
                label: this.escapeExpression(a.label),
                children: 0,
                disabled: a.disabled
            }), f = a.childNodes, g = [], d = 0, e = f.length; e > d; d++)c = f[d], g.push(this.add_option(c, b, a.disabled));
            return g
        }, SelectParser.prototype.add_option = function (a, b, c) {
            return "OPTION" === a.nodeName.toUpperCase() ? ("" !== a.text ? (null != b && (this.parsed[b].children += 1), this.parsed.push({
                array_index: this.parsed.length,
                options_index: this.options_index,
                value: a.value,
                text: a.text,
                html: a.innerHTML,
                selected: a.selected,
                disabled: c === !0 ? c : a.disabled,
                group_array_index: b,
                classes: a.className,
                style: a.style.cssText
            })) : this.parsed.push({
                array_index: this.parsed.length,
                options_index: this.options_index,
                empty: !0
            }), this.options_index += 1) : void 0
        }, SelectParser.prototype.escapeExpression = function (a) {
            var b, c;
            return null == a || a === !1 ? "" : /[\&\<\>\"\'\`]/.test(a) ? (b = {
                "<": "&lt;",
                ">": "&gt;",
                '"': "&quot;",
                "'": "&#x27;",
                "`": "&#x60;"
            }, c = /&(?!\w+;)|[\<\>\"\'\`]/g, a.replace(c, function (a) {
                return b[a] || "&amp;"
            })) : a
        }, SelectParser
    }(), SelectParser.select_to_array = function (a) {
        var b, c, d, e, f;
        for (c = new SelectParser, f = a.childNodes, d = 0, e = f.length; e > d; d++)b = f[d], c.add_node(b);
        return c.parsed
    }, AbstractChosen = function () {
        function AbstractChosen(a, b) {
            this.form_field = a, this.options = null != b ? b : {}, AbstractChosen.browser_is_supported() && (this.is_multiple = this.form_field.multiple, this.set_default_text(), this.set_default_values(), this.setup(), this.set_up_html(), this.register_observers())
        }

        return AbstractChosen.prototype.set_default_values = function () {
            var a = this;
            return this.click_test_action = function (b) {
                return a.test_active_click(b)
            }, this.activate_action = function (b) {
                return a.activate_field(b)
            }, this.active_field = !1, this.mouse_on_container = !1, this.results_showing = !1, this.result_highlighted = null, this.result_single_selected = null, this.allow_single_deselect = null != this.options.allow_single_deselect && null != this.form_field.options[0] && "" === this.form_field.options[0].text ? this.options.allow_single_deselect : !1, this.disable_search_threshold = this.options.disable_search_threshold || 0, this.disable_search = this.options.disable_search || !1, this.enable_split_word_search = null != this.options.enable_split_word_search ? this.options.enable_split_word_search : !0, this.group_search = null != this.options.group_search ? this.options.group_search : !0, this.search_contains = this.options.search_contains || !1, this.single_backstroke_delete = null != this.options.single_backstroke_delete ? this.options.single_backstroke_delete : !0, this.max_selected_options = this.options.max_selected_options || 1 / 0, this.inherit_select_classes = this.options.inherit_select_classes || !1, this.display_selected_options = null != this.options.display_selected_options ? this.options.display_selected_options : !0, this.display_disabled_options = null != this.options.display_disabled_options ? this.options.display_disabled_options : !0
        }, AbstractChosen.prototype.set_default_text = function () {
            return this.default_text = this.form_field.getAttribute("data-placeholder") ? this.form_field.getAttribute("data-placeholder") : this.is_multiple ? this.options.placeholder_text_multiple || this.options.placeholder_text || AbstractChosen.default_multiple_text : this.options.placeholder_text_single || this.options.placeholder_text || AbstractChosen.default_single_text, this.results_none_found = this.form_field.getAttribute("data-no_results_text") || this.options.no_results_text || AbstractChosen.default_no_result_text
        }, AbstractChosen.prototype.mouse_enter = function () {
            return this.mouse_on_container = !0
        }, AbstractChosen.prototype.mouse_leave = function () {
            return this.mouse_on_container = !1
        }, AbstractChosen.prototype.input_focus = function () {
            var a = this;
            if (this.is_multiple) {
                if (!this.active_field)return setTimeout(function () {
                    return a.container_mousedown()
                }, 50)
            } else if (!this.active_field)return this.activate_field()
        }, AbstractChosen.prototype.input_blur = function () {
            var a = this;
            return this.mouse_on_container ? void 0 : (this.active_field = !1, setTimeout(function () {
                return a.blur_test()
            }, 100))
        }, AbstractChosen.prototype.results_option_build = function (a) {
            var b, c, d, e, f;
            for (b = "", f = this.results_data, d = 0, e = f.length; e > d; d++)c = f[d], b += c.group ? this.result_add_group(c) : this.result_add_option(c), (null != a ? a.first : void 0) && (c.selected && this.is_multiple ? this.choice_build(c) : c.selected && !this.is_multiple && this.single_set_selected_text(c.text));
            return b
        }, AbstractChosen.prototype.result_add_option = function (a) {
            var b, c;
            return a.search_match ? this.include_option_in_results(a) ? (b = [], a.disabled || a.selected && this.is_multiple || b.push("active-result"), !a.disabled || a.selected && this.is_multiple || b.push("disabled-result"), a.selected && b.push("result-selected"), null != a.group_array_index && b.push("group-option"), "" !== a.classes && b.push(a.classes), c = "" !== a.style.cssText ? ' style="' + a.style + '"' : "", '<li class="' + b.join(" ") + '"' + c + ' data-option-array-index="' + a.array_index + '">' + a.search_text + "</li>") : "" : ""
        }, AbstractChosen.prototype.result_add_group = function (a) {
            return a.search_match || a.group_match ? a.active_options > 0 ? '<li class="group-result">' + a.search_text + "</li>" : "" : ""
        }, AbstractChosen.prototype.results_update_field = function () {
            return this.set_default_text(), this.is_multiple || this.results_reset_cleanup(), this.result_clear_highlight(), this.result_single_selected = null, this.results_build(), this.results_showing ? this.winnow_results() : void 0
        }, AbstractChosen.prototype.results_toggle = function () {
            return this.results_showing ? this.results_hide() : this.results_show()
        }, AbstractChosen.prototype.results_search = function () {
            return this.results_showing ? this.winnow_results() : this.results_show()
        }, AbstractChosen.prototype.winnow_results = function () {
            var a, b, c, d, e, f, g, h, i, j, k, l, m;
            for (this.no_results_clear(), e = 0, g = this.get_search_text(), a = g.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"), d = this.search_contains ? "" : "^", c = new RegExp(d + a, "i"), j = new RegExp(a, "i"), m = this.results_data, k = 0, l = m.length; l > k; k++)b = m[k], b.search_match = !1, f = null, this.include_option_in_results(b) && (b.group && (b.group_match = !1, b.active_options = 0), null != b.group_array_index && this.results_data[b.group_array_index] && (f = this.results_data[b.group_array_index], 0 === f.active_options && f.search_match && (e += 1), f.active_options += 1), (!b.group || this.group_search) && (b.search_text = b.group ? b.label : b.html, b.search_match = this.search_string_match(b.search_text, c), b.search_match && !b.group && (e += 1), b.search_match ? (g.length && (h = b.search_text.search(j), i = b.search_text.substr(0, h + g.length) + "</em>" + b.search_text.substr(h + g.length), b.search_text = i.substr(0, h) + "<em>" + i.substr(h)), null != f && (f.group_match = !0)) : null != b.group_array_index && this.results_data[b.group_array_index].search_match && (b.search_match = !0)));
            return this.result_clear_highlight(), 1 > e && g.length ? (this.update_results_content(""), this.no_results(g)) : (this.update_results_content(this.results_option_build()), this.winnow_results_set_highlight())
        }, AbstractChosen.prototype.search_string_match = function (a, b) {
            var c, d, e, f;
            if (b.test(a))return !0;
            if (this.enable_split_word_search && (a.indexOf(" ") >= 0 || 0 === a.indexOf("[")) && (d = a.replace(/\[|\]/g, "").split(" "), d.length))for (e = 0, f = d.length; f > e; e++)if (c = d[e], b.test(c))return !0
        }, AbstractChosen.prototype.choices_count = function () {
            var a, b, c, d;
            if (null != this.selected_option_count)return this.selected_option_count;
            for (this.selected_option_count = 0, d = this.form_field.options, b = 0, c = d.length; c > b; b++)a = d[b], a.selected && (this.selected_option_count += 1);
            return this.selected_option_count
        }, AbstractChosen.prototype.choices_click = function (a) {
            return a.preventDefault(), this.results_showing || this.is_disabled ? void 0 : this.results_show()
        }, AbstractChosen.prototype.keyup_checker = function (a) {
            var b, c;
            switch (b = null != (c = a.which) ? c : a.keyCode, this.search_field_scale(), b) {
                case 8:
                    if (this.is_multiple && this.backstroke_length < 1 && this.choices_count() > 0)return this.keydown_backstroke();
                    if (!this.pending_backstroke)return this.result_clear_highlight(), this.results_search();
                    break;
                case 13:
                    if (a.preventDefault(), this.results_showing)return this.result_select(a);
                    break;
                case 27:
                    return this.results_showing && this.results_hide(), !0;
                case 9:
                case 38:
                case 40:
                case 16:
                case 91:
                case 17:
                    break;
                default:
                    return this.results_search()
            }
        }, AbstractChosen.prototype.container_width = function () {
            return null != this.options.width ? this.options.width : "" + this.form_field.offsetWidth + "px"
        }, AbstractChosen.prototype.include_option_in_results = function (a) {
            return this.is_multiple && !this.display_selected_options && a.selected ? !1 : !this.display_disabled_options && a.disabled ? !1 : a.empty ? !1 : !0
        }, AbstractChosen.browser_is_supported = function () {
            return "Microsoft Internet Explorer" === window.navigator.appName ? document.documentMode >= 8 : /iP(od|hone)/i.test(window.navigator.userAgent) ? !1 : /Android/i.test(window.navigator.userAgent) && /Mobile/i.test(window.navigator.userAgent) ? !1 : !0
        }, AbstractChosen.default_multiple_text = "Select Some Options", AbstractChosen.default_single_text = "Select an Option", AbstractChosen.default_no_result_text = "No results match", AbstractChosen
    }(), a = jQuery, a.fn.extend({
        chosen: function (b) {
            return AbstractChosen.browser_is_supported() ? this.each(function () {
                var c, d;
                c = a(this), d = c.data("chosen"), "destroy" === b && d ? d.destroy() : d || c.data("chosen", new Chosen(this, b))
            }) : this
        }
    }), Chosen = function (c) {
        function Chosen() {
            return b = Chosen.__super__.constructor.apply(this, arguments)
        }

        return d(Chosen, c), Chosen.prototype.setup = function () {
            return this.form_field_jq = a(this.form_field), this.current_selectedIndex = this.form_field.selectedIndex, this.is_rtl = this.form_field_jq.hasClass("chosen-rtl")
        }, Chosen.prototype.set_up_html = function () {
            var b, c;
            return b = ["chosen-container"], b.push("chosen-container-" + (this.is_multiple ? "multi" : "single")), this.inherit_select_classes && this.form_field.className && b.push(this.form_field.className), this.is_rtl && b.push("chosen-rtl"), c = {
                "class": b.join(" "),
                style: "width: " + this.container_width() + ";",
                title: this.form_field.title
            }, this.form_field.id.length && (c.id = this.form_field.id.replace(/[^\w]/g, "_") + "_chosen"), this.container = a("<div />", c), this.is_multiple ? this.container.html('<ul class="chosen-choices"><li class="search-field"><input type="text" value="' + this.default_text + '" class="default" autocomplete="off" style="width:25px;" /></li></ul><div class="chosen-drop"><ul class="chosen-results"></ul></div>') : this.container.html('<a class="chosen-single chosen-default" tabindex="-1"><span>' + this.default_text + '</span><div><b></b></div></a><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off" /></div><ul class="chosen-results"></ul></div>'), this.form_field_jq.hide().after(this.container), this.dropdown = this.container.find("div.chosen-drop").first(), this.search_field = this.container.find("input").first(), this.search_results = this.container.find("ul.chosen-results").first(), this.search_field_scale(), this.search_no_results = this.container.find("li.no-results").first(), this.is_multiple ? (this.search_choices = this.container.find("ul.chosen-choices").first(), this.search_container = this.container.find("li.search-field").first()) : (this.search_container = this.container.find("div.chosen-search").first(), this.selected_item = this.container.find(".chosen-single").first()), this.results_build(), this.set_tab_index(), this.set_label_behavior(), this.form_field_jq.trigger("chosen:ready", {chosen: this})
        }, Chosen.prototype.register_observers = function () {
            var a = this;
            return this.container.bind("mousedown.chosen", function (b) {
                a.container_mousedown(b)
            }), this.container.bind("mouseup.chosen", function (b) {
                a.container_mouseup(b)
            }), this.container.bind("mouseenter.chosen", function (b) {
                a.mouse_enter(b)
            }), this.container.bind("mouseleave.chosen", function (b) {
                a.mouse_leave(b)
            }), this.search_results.bind("mouseup.chosen", function (b) {
                a.search_results_mouseup(b)
            }), this.search_results.bind("mouseover.chosen", function (b) {
                a.search_results_mouseover(b)
            }), this.search_results.bind("mouseout.chosen", function (b) {
                a.search_results_mouseout(b)
            }), this.search_results.bind("mousewheel.chosen DOMMouseScroll.chosen", function (b) {
                a.search_results_mousewheel(b)
            }), this.form_field_jq.bind("chosen:updated.chosen", function (b) {
                a.results_update_field(b)
            }), this.form_field_jq.bind("chosen:activate.chosen", function (b) {
                a.activate_field(b)
            }), this.form_field_jq.bind("chosen:open.chosen", function (b) {
                a.container_mousedown(b)
            }), this.search_field.bind("blur.chosen", function (b) {
                a.input_blur(b)
            }), this.search_field.bind("keyup.chosen", function (b) {
                a.keyup_checker(b)
            }), this.search_field.bind("keydown.chosen", function (b) {
                a.keydown_checker(b)
            }), this.search_field.bind("focus.chosen", function (b) {
                a.input_focus(b)
            }), this.is_multiple ? this.search_choices.bind("click.chosen", function (b) {
                a.choices_click(b)
            }) : this.container.bind("click.chosen", function (a) {
                a.preventDefault()
            })
        }, Chosen.prototype.destroy = function () {
            return a(document).unbind("click.chosen", this.click_test_action), this.search_field[0].tabIndex && (this.form_field_jq[0].tabIndex = this.search_field[0].tabIndex), this.container.remove(), this.form_field_jq.removeData("chosen"), this.form_field_jq.show()
        }, Chosen.prototype.search_field_disabled = function () {
            return this.is_disabled = this.form_field_jq[0].disabled, this.is_disabled ? (this.container.addClass("chosen-disabled"), this.search_field[0].disabled = !0, this.is_multiple || this.selected_item.unbind("focus.chosen", this.activate_action), this.close_field()) : (this.container.removeClass("chosen-disabled"), this.search_field[0].disabled = !1, this.is_multiple ? void 0 : this.selected_item.bind("focus.chosen", this.activate_action))
        }, Chosen.prototype.container_mousedown = function (b) {
            return this.is_disabled || (b && "mousedown" === b.type && !this.results_showing && b.preventDefault(), null != b && a(b.target).hasClass("search-choice-close")) ? void 0 : (this.active_field ? this.is_multiple || !b || a(b.target)[0] !== this.selected_item[0] && !a(b.target).parents("a.chosen-single").length || (b.preventDefault(), this.results_toggle()) : (this.is_multiple && this.search_field.val(""), a(document).bind("click.chosen", this.click_test_action), this.results_show()), this.activate_field())
        }, Chosen.prototype.container_mouseup = function (a) {
            return "ABBR" !== a.target.nodeName || this.is_disabled ? void 0 : this.results_reset(a)
        }, Chosen.prototype.search_results_mousewheel = function (a) {
            var b, c, d;
            return b = -(null != (c = a.originalEvent) ? c.wheelDelta : void 0) || (null != (d = a.originialEvent) ? d.detail : void 0), null != b ? (a.preventDefault(), "DOMMouseScroll" === a.type && (b = 40 * b), this.search_results.scrollTop(b + this.search_results.scrollTop())) : void 0
        }, Chosen.prototype.blur_test = function () {
            return !this.active_field && this.container.hasClass("chosen-container-active") ? this.close_field() : void 0
        }, Chosen.prototype.close_field = function () {
            return a(document).unbind("click.chosen", this.click_test_action), this.active_field = !1, this.results_hide(), this.container.removeClass("chosen-container-active"), this.clear_backstroke(), this.show_search_field_default(), this.search_field_scale()
        }, Chosen.prototype.activate_field = function () {
            return this.container.addClass("chosen-container-active"), this.active_field = !0, this.search_field.val(this.search_field.val()), this.search_field.focus()
        }, Chosen.prototype.test_active_click = function (b) {
            return this.container.is(a(b.target).closest(".chosen-container")) ? this.active_field = !0 : this.close_field()
        }, Chosen.prototype.results_build = function () {
            return this.parsing = !0, this.selected_option_count = null, this.results_data = SelectParser.select_to_array(this.form_field), this.is_multiple ? this.search_choices.find("li.search-choice").remove() : this.is_multiple || (this.single_set_selected_text(), this.disable_search || this.form_field.options.length <= this.disable_search_threshold ? (this.search_field[0].readOnly = !0, this.container.addClass("chosen-container-single-nosearch")) : (this.search_field[0].readOnly = !1, this.container.removeClass("chosen-container-single-nosearch"))), this.update_results_content(this.results_option_build({first: !0})), this.search_field_disabled(), this.show_search_field_default(), this.search_field_scale(), this.parsing = !1
        }, Chosen.prototype.result_do_highlight = function (a) {
            var b, c, d, e, f;
            if (a.length) {
                if (this.result_clear_highlight(), this.result_highlight = a, this.result_highlight.addClass("highlighted"), d = parseInt(this.search_results.css("maxHeight"), 10), f = this.search_results.scrollTop(), e = d + f, c = this.result_highlight.position().top + this.search_results.scrollTop(), b = c + this.result_highlight.outerHeight(), b >= e)return this.search_results.scrollTop(b - d > 0 ? b - d : 0);
                if (f > c)return this.search_results.scrollTop(c)
            }
        }, Chosen.prototype.result_clear_highlight = function () {
            return this.result_highlight && this.result_highlight.removeClass("highlighted"), this.result_highlight = null
        }, Chosen.prototype.results_show = function () {
            return this.is_multiple && this.max_selected_options <= this.choices_count() ? (this.form_field_jq.trigger("chosen:maxselected", {chosen: this}), !1) : (this.container.addClass("chosen-with-drop"), this.form_field_jq.trigger("chosen:showing_dropdown", {chosen: this}), this.results_showing = !0, this.search_field.focus(), this.search_field.val(this.search_field.val()), this.winnow_results())
        }, Chosen.prototype.update_results_content = function (a) {
            return this.search_results.html(a)
        }, Chosen.prototype.results_hide = function () {
            return this.results_showing && (this.result_clear_highlight(), this.container.removeClass("chosen-with-drop"), this.form_field_jq.trigger("chosen:hiding_dropdown", {chosen: this})), this.results_showing = !1
        }, Chosen.prototype.set_tab_index = function () {
            var a;
            return this.form_field.tabIndex ? (a = this.form_field.tabIndex, this.form_field.tabIndex = -1, this.search_field[0].tabIndex = a) : void 0
        }, Chosen.prototype.set_label_behavior = function () {
            var b = this;
            return this.form_field_label = this.form_field_jq.parents("label"), !this.form_field_label.length && this.form_field.id.length && (this.form_field_label = a("label[for='" + this.form_field.id + "']")), this.form_field_label.length > 0 ? this.form_field_label.bind("click.chosen", function (a) {
                return b.is_multiple ? b.container_mousedown(a) : b.activate_field()
            }) : void 0
        }, Chosen.prototype.show_search_field_default = function () {
            return this.is_multiple && this.choices_count() < 1 && !this.active_field ? (this.search_field.val(this.default_text), this.search_field.addClass("default")) : (this.search_field.val(""), this.search_field.removeClass("default"))
        }, Chosen.prototype.search_results_mouseup = function (b) {
            var c;
            return c = a(b.target).hasClass("active-result") ? a(b.target) : a(b.target).parents(".active-result").first(), c.length ? (this.result_highlight = c, this.result_select(b), this.search_field.focus()) : void 0
        }, Chosen.prototype.search_results_mouseover = function (b) {
            var c;
            return c = a(b.target).hasClass("active-result") ? a(b.target) : a(b.target).parents(".active-result").first(), c ? this.result_do_highlight(c) : void 0
        }, Chosen.prototype.search_results_mouseout = function (b) {
            return a(b.target).hasClass("active-result") ? this.result_clear_highlight() : void 0
        }, Chosen.prototype.choice_build = function (b) {
            var c, d, e = this;
            return c = a("<li />", {"class": "search-choice"}).html("<span>" + b.html + "</span>"), b.disabled ? c.addClass("search-choice-disabled") : (d = a("<a />", {
                "class": "search-choice-close",
                "data-option-array-index": b.array_index
            }), d.bind("click.chosen", function (a) {
                return e.choice_destroy_link_click(a)
            }), c.append(d)), this.search_container.before(c)
        }, Chosen.prototype.choice_destroy_link_click = function (b) {
            return b.preventDefault(), b.stopPropagation(), this.is_disabled ? void 0 : this.choice_destroy(a(b.target))
        }, Chosen.prototype.choice_destroy = function (a) {
            return this.result_deselect(a[0].getAttribute("data-option-array-index")) ? (this.show_search_field_default(), this.is_multiple && this.choices_count() > 0 && this.search_field.val().length < 1 && this.results_hide(), a.parents("li").first().remove(), this.search_field_scale()) : void 0
        }, Chosen.prototype.results_reset = function () {
            return this.form_field.options[0].selected = !0, this.selected_option_count = null, this.single_set_selected_text(), this.show_search_field_default(), this.results_reset_cleanup(), this.form_field_jq.trigger("change"), this.active_field ? this.results_hide() : void 0
        }, Chosen.prototype.results_reset_cleanup = function () {
            return this.current_selectedIndex = this.form_field.selectedIndex, this.selected_item.find("abbr").remove()
        }, Chosen.prototype.result_select = function (a) {
            var b, c, d;
            return this.result_highlight ? (b = this.result_highlight, this.result_clear_highlight(), this.is_multiple && this.max_selected_options <= this.choices_count() ? (this.form_field_jq.trigger("chosen:maxselected", {chosen: this}), !1) : (this.is_multiple ? b.removeClass("active-result") : (this.result_single_selected && (this.result_single_selected.removeClass("result-selected"), d = this.result_single_selected[0].getAttribute("data-option-array-index"), this.results_data[d].selected = !1), this.result_single_selected = b), b.addClass("result-selected"), c = this.results_data[b[0].getAttribute("data-option-array-index")], c.selected = !0, this.form_field.options[c.options_index].selected = !0, this.selected_option_count = null, this.is_multiple ? this.choice_build(c) : this.single_set_selected_text(c.text), (a.metaKey || a.ctrlKey) && this.is_multiple || this.results_hide(), this.search_field.val(""), (this.is_multiple || this.form_field.selectedIndex !== this.current_selectedIndex) && this.form_field_jq.trigger("change", {selected: this.form_field.options[c.options_index].value}), this.current_selectedIndex = this.form_field.selectedIndex, this.search_field_scale())) : void 0
        }, Chosen.prototype.single_set_selected_text = function (a) {
            return null == a && (a = this.default_text), a === this.default_text ? this.selected_item.addClass("chosen-default") : (this.single_deselect_control_build(), this.selected_item.removeClass("chosen-default")), this.selected_item.find("span").text(a)
        }, Chosen.prototype.result_deselect = function (a) {
            var b;
            return b = this.results_data[a], this.form_field.options[b.options_index].disabled ? !1 : (b.selected = !1, this.form_field.options[b.options_index].selected = !1, this.selected_option_count = null, this.result_clear_highlight(), this.results_showing && this.winnow_results(), this.form_field_jq.trigger("change", {deselected: this.form_field.options[b.options_index].value}), this.search_field_scale(), !0)
        }, Chosen.prototype.single_deselect_control_build = function () {
            return this.allow_single_deselect ? (this.selected_item.find("abbr").length || this.selected_item.find("span").first().after('<abbr class="search-choice-close"></abbr>'), this.selected_item.addClass("chosen-single-with-deselect")) : void 0
        }, Chosen.prototype.get_search_text = function () {
            return this.search_field.val() === this.default_text ? "" : a("<div/>").text(a.trim(this.search_field.val())).html()
        }, Chosen.prototype.winnow_results_set_highlight = function () {
            var a, b;
            return b = this.is_multiple ? [] : this.search_results.find(".result-selected.active-result"), a = b.length ? b.first() : this.search_results.find(".active-result").first(), null != a ? this.result_do_highlight(a) : void 0
        }, Chosen.prototype.no_results = function (b) {
            var c;
            return c = a('<li class="no-results">' + this.results_none_found + ' "<span></span>"</li>'), c.find("span").first().html(b), this.search_results.append(c)
        }, Chosen.prototype.no_results_clear = function () {
            return this.search_results.find(".no-results").remove()
        }, Chosen.prototype.keydown_arrow = function () {
            var a;
            return this.results_showing && this.result_highlight ? (a = this.result_highlight.nextAll("li.active-result").first()) ? this.result_do_highlight(a) : void 0 : this.results_show()
        }, Chosen.prototype.keyup_arrow = function () {
            var a;
            return this.results_showing || this.is_multiple ? this.result_highlight ? (a = this.result_highlight.prevAll("li.active-result"), a.length ? this.result_do_highlight(a.first()) : (this.choices_count() > 0 && this.results_hide(), this.result_clear_highlight())) : void 0 : this.results_show()
        }, Chosen.prototype.keydown_backstroke = function () {
            var a;
            return this.pending_backstroke ? (this.choice_destroy(this.pending_backstroke.find("a").first()), this.clear_backstroke()) : (a = this.search_container.siblings("li.search-choice").last(), a.length && !a.hasClass("search-choice-disabled") ? (this.pending_backstroke = a, this.single_backstroke_delete ? this.keydown_backstroke() : this.pending_backstroke.addClass("search-choice-focus")) : void 0)
        }, Chosen.prototype.clear_backstroke = function () {
            return this.pending_backstroke && this.pending_backstroke.removeClass("search-choice-focus"), this.pending_backstroke = null
        }, Chosen.prototype.keydown_checker = function (a) {
            var b, c;
            switch (b = null != (c = a.which) ? c : a.keyCode, this.search_field_scale(), 8 !== b && this.pending_backstroke && this.clear_backstroke(), b) {
                case 8:
                    this.backstroke_length = this.search_field.val().length;
                    break;
                case 9:
                    this.results_showing && !this.is_multiple && this.result_select(a), this.mouse_on_container = !1;
                    break;
                case 13:
                    a.preventDefault();
                    break;
                case 38:
                    a.preventDefault(), this.keyup_arrow();
                    break;
                case 40:
                    a.preventDefault(), this.keydown_arrow()
            }
        }, Chosen.prototype.search_field_scale = function () {
            var b, c, d, e, f, g, h, i, j;
            if (this.is_multiple) {
                for (d = 0, h = 0, f = "position:absolute; left: -1000px; top: -1000px; display:none;", g = ["font-size", "font-style", "font-weight", "font-family", "line-height", "text-transform", "letter-spacing"], i = 0, j = g.length; j > i; i++)e = g[i], f += e + ":" + this.search_field.css(e) + ";";
                return b = a("<div />", {style: f}), b.text(this.search_field.val()), a("body").append(b), h = b.width() + 25, b.remove(), c = this.container.outerWidth(), h > c - 10 && (h = c - 10), this.search_field.css({width: h + "px"})
            }
        }, Chosen
    }(AbstractChosen)
}.call(this);
/*
 * Notices
 */
(function ($) {
    $.sticky = function (note, options, callback) {
        return $.fn.sticky(note, options, callback)
    };
    $.fn.sticky = function (note, options, callback) {
        var settings = {speed: "fast", duplicates: true, autoclose: 5000, title: "", type: ""};
        if (!note) {
            note = this.html()
        }
        if (options) {
            $.extend(settings, options)
        }
        var display = true;
        var duplicate = "no";
        var uniqID = Math.floor(Math.random() * 99999);
        $(".wojo.message.notice").each(function () {
            if ($(this).html() == note && $(this).is(":visible")) {
                duplicate = "yes";
                if (!settings.duplicates) {
                    display = false
                }
            }
            if ($(this).attr("id") == uniqID) {
                uniqID = Math.floor(Math.random() * 9999999)
            }
        });
        if (!$("body").find("#wojo-overlay").html()) {
            $("body").append('<div id="wojo-overlay"></div>')
        }
        if (display) {
            $("#wojo-overlay").prepend('<div class="wojo message notice ' + settings.type + '" id="' + uniqID + '"></div>');
            $("#" + uniqID).append('<div class="content"><span>' + settings.title + '</span><a class="notice-close" data-id="' + uniqID + '"title="Close"><i class="icon close"></i></a></div>');
            $("#" + uniqID).append('<p class="sticky-note" data-id="' + uniqID + '">' + note + "</p>");
            $("#" + uniqID).slideDown(settings.speed);
            display = true
        }
        $(".wojo.message.notice").ready(function () {
            if (settings.autoclose) {
                $("#" + uniqID).delay(settings.autoclose).slideUp(settings.speed)
            }
        });
        $(".wojo.message.notice").click(function () {
            $(this).dequeue().slideUp(settings.speed)
        });
        var response = {
            id: uniqID,
            duplicate: duplicate,
            displayed: display,
            type: settings.type,
            title: settings.title
        };
        if (callback) {
            callback(response)
        } else {
            return (response)
        }
    }
})(jQuery);
/*
 * # Semantic - Dropdown
 * http://github.com/jlukic/semantic-ui/
 */
(function (c, b, a, d) {
    c.fn.dropdown = function (o) {
        var m = c(this), h = c(a), j = m.selector || "", i = ("ontouchstart" in a.documentElement), f = new Date().getTime(), l = [], k = arguments[0], e = (typeof k == "string"), n = [].slice.call(arguments, 1), g;
        m.each(function () {
            var r = (c.isPlainObject(o)) ? c.extend(true, {}, c.fn.dropdown.settings, o) : c.extend({}, c.fn.dropdown.settings), w = r.className, A = r.metadata, s = r.namespace, t = r.selector, x = r.error, E = "." + s, v = "module-" + s, z = c(this), C = z.find(t.item), B = z.find(t.text), y = z.find(t.input), p = z.children(t.menu), u = this, D = z.data(v), q;
            q = {
                initialize: function () {
                    q.debug("Initializing dropdown", r);
                    q.save.defaults();
                    q.set.selected();
                    if (i) {
                        q.bind.touchEvents()
                    }
                    q.bind.mouseEvents();
                    q.instantiate()
                }, instantiate: function () {
                    q.verbose("Storing instance of dropdown", q);
                    D = q;
                    z.data(v, q)
                }, destroy: function () {
                    q.verbose("Destroying previous dropdown for", z);
                    C.off(E);
                    z.off(E).removeData(v)
                }, bind: {
                    touchEvents: function () {
                        q.debug("Touch device detected binding touch events");
                        z.on("touchstart" + E, q.event.test.toggle);
                        C.on("touchstart" + E, q.event.item.mouseenter).on("touchstart" + E, q.event.item.click)
                    }, mouseEvents: function () {
                        q.verbose("Mouse detected binding mouse events");
                        if (r.on == "click") {
                            z.on("click" + E, q.event.test.toggle)
                        } else {
                            if (r.on == "hover") {
                                z.on("mouseenter" + E, q.delay.show).on("mouseleave" + E, q.delay.hide)
                            } else {
                                z.on(r.on + E, q.toggle)
                            }
                        }
                        C.on("mouseenter" + E, q.event.item.mouseenter).on("mouseleave" + E, q.event.item.mouseleave).on("click" + E, q.event.item.click)
                    }, intent: function () {
                        q.verbose("Binding hide intent event to document");
                        if (i) {
                            h.on("touchstart" + E, q.event.test.touch).on("touchmove" + E, q.event.test.touch)
                        }
                        h.on("click" + E, q.event.test.hide)
                    }
                }, unbind: {
                    intent: function () {
                        q.verbose("Removing hide intent event from document");
                        if (i) {
                            h.off("touchstart" + E).off("touchmove" + E)
                        }
                        h.off("click" + E)
                    }
                }, event: {
                    test: {
                        toggle: function (F) {
                            if (q.determine.intent(F, q.toggle)) {
                                F.preventDefault()
                            }
                        }, touch: function (F) {
                            q.determine.intent(F, function () {
                                if (F.type == "touchstart") {
                                    q.timer = setTimeout(q.hide, r.delay.touch)
                                } else {
                                    if (F.type == "touchmove") {
                                        clearTimeout(q.timer)
                                    }
                                }
                            });
                            F.stopPropagation()
                        }, hide: function (F) {
                            q.determine.intent(F, q.hide)
                        }
                    }, item: {
                        mouseenter: function (H) {
                            var F = c(this).find(t.menu), G = c(this).siblings(t.item).children(t.menu);
                            if (F.size() > 0) {
                                clearTimeout(q.itemTimer);
                                q.itemTimer = setTimeout(function () {
                                    q.animate.hide(false, G);
                                    q.verbose("Showing sub-menu", F);
                                    q.animate.show(false, F)
                                }, r.delay.show * 2);
                                H.preventDefault()
                            }
                        }, mouseleave: function (G) {
                            var F = c(this).find(t.menu);
                            if (F.size() > 0) {
                                clearTimeout(q.itemTimer);
                                q.itemTimer = setTimeout(function () {
                                    q.verbose("Hiding sub-menu", F);
                                    q.animate.hide(false, F)
                                }, r.delay.hide)
                            }
                        }, click: function (G) {
                            var F = c(this), I = (F.data(A.text) !== d) ? F.data(A.text) : F.text(), H = (F.data(A.value) !== d) ? F.data(A.value) : I.toLowerCase(), J = function () {
                                q.determine.selectAction(I, H);
                                c.proxy(r.onChange, u)(H, I)
                            };
                            if (F.find(t.menu).size() === 0) {
                                if (G.type == "touchstart") {
                                    F.one("click", J)
                                } else {
                                    J()
                                }
                            }
                        }
                    }, resetStyle: function () {
                        c(this).removeAttr("style")
                    }
                }, determine: {
                    selectAction: function (G, F) {
                        q.verbose("Determining action", r.action);
                        if (c.isFunction(q.action[r.action])) {
                            q.verbose("Triggering preset action", r.action, G, F);
                            q.action[r.action](G, F)
                        } else {
                            if (c.isFunction(r.action)) {
                                q.verbose("Triggering user action", r.action, G, F);
                                r.action(G, F)
                            } else {
                                q.error(x.action, r.action)
                            }
                        }
                    }, intent: function (F, G) {
                        q.debug("Determining whether event occurred in dropdown", F.target);
                        G = G || function () {
                            };
                        if (c(F.target).closest(p).size() === 0) {
                            q.verbose("Triggering event", G);
                            G();
                            return true
                        } else {
                            q.verbose("Event occurred in dropdown, canceling callback");
                            return false
                        }
                    }
                }, action: {
                    nothing: function () {
                    }, hide: function () {
                        q.hide()
                    }, activate: function (G, F) {
                        F = (F !== d) ? F : G;
                        q.set.selected(F);
                        q.set.value(F);
                        q.hide()
                    }, auto: function (G, F) {
                        F = (F !== d) ? F : G;
                        q.set.selected(F);
                        q.set.value(F);
                        q.hide()
                    }, changeText: function (G, F) {
                        F = (F !== d) ? F : G;
                        q.set.selected(F);
                        q.hide()
                    }, updateForm: function (G, F) {
                        F = (F !== d) ? F : G;
                        q.set.selected(F);
                        q.set.value(F);
                        q.hide()
                    }
                }, get: {
                    text: function () {
                        return B.text()
                    }, value: function () {
                        return (y.size() > 0) ? y.val() : z.data(A.value)
                    }, item: function (G) {
                        var F = false;
                        G = (G !== d) ? G : (q.get.value() !== d) ? q.get.value() : q.get.text();
                        if (G !== d) {
                            C.each(function () {
                                var H = c(this), J = (H.data(A.text) !== d) ? H.data(A.text) : H.text(), I = (H.data(A.value) !== d) ? H.data(A.value) : J.toLowerCase();
                                if (I == G) {
                                    F = c(this)
                                } else {
                                    if (!F && J == G) {
                                        F = c(this)
                                    }
                                }
                            })
                        } else {
                            G = q.get.text()
                        }
                        return F || false
                    }
                }, restore: {
                    defaults: function () {
                        q.restore.defaultText();
                        q.restore.defaultValue()
                    }, defaultText: function () {
                        var F = z.data(A.defaultText);
                        q.debug("Restoring default text", F);
                        q.set.text(F)
                    }, defaultValue: function () {
                        var F = z.data(A.defaultValue);
                        if (F !== d) {
                            q.debug("Restoring default value", F);
                            q.set.selected(F);
                            q.set.value(F)
                        }
                    }
                }, save: {
                    defaults: function () {
                        q.save.defaultText();
                        q.save.defaultValue()
                    }, defaultValue: function () {
                        z.data(A.defaultValue, q.get.value())
                    }, defaultText: function () {
                        z.data(A.defaultText, B.text())
                    }
                }, set: {
                    text: function (F) {
                        q.debug("Changing text", F, B);
                        B.removeClass(w.placeholder);
                        B.text(F)
                    }, value: function (F) {
                        q.debug("Adding selected value to hidden input", F, y);
                        if (y.size() > 0) {
                            y.val(F)
                        } else {
                            z.data(A.value, F)
                        }
                    }, active: function () {
                        z.addClass(w.active)
                    }, visible: function () {
                        z.addClass(w.visible)
                    }, selected: function (G) {
                        var F = q.get.item(G), H;
                        if (F) {
                            q.debug("Setting selected menu item to", F);
                            H = (F.data(A.text) !== d) ? F.data(A.text) : F.text();
                            C.removeClass(w.active);
                            F.addClass(w.active);
                            q.set.text(H)
                        }
                    }
                }, remove: {
                    active: function () {
                        z.removeClass(w.active)
                    }, visible: function () {
                        z.removeClass(w.visible)
                    }
                }, is: {
                    selection: function () {
                        return z.hasClass(w.selection)
                    }, animated: function (F) {
                        return (F) ? F.is(":animated") : p.is(":animated")
                    }, visible: function (F) {
                        return (F) ? F.is(":visible") : p.is(":visible")
                    }, hidden: function (F) {
                        return (F) ? F.is(":not(:visible)") : p.is(":not(:visible)")
                    }
                }, can: {
                    click: function () {
                        return (i || r.on == "click")
                    }, show: function () {
                        return !z.hasClass(w.disabled)
                    }
                }, animate: {
                    show: function (H, G) {
                        var F = G || p;
                        H = H || function () {
                            };
                        if (q.is.hidden(F)) {
                            q.verbose("Doing menu show animation", F);
                            if (r.transition == "none") {
                                H()
                            } else {
                                if (c.fn.transition !== d && z.transition("is supported")) {
                                    F.transition({
                                        animation: r.transition + " in",
                                        duration: r.duration,
                                        complete: H,
                                        queue: false
                                    })
                                } else {
                                    if (r.transition == "slide down") {
                                        F.hide().clearQueue().children().clearQueue().css("opacity", 0).delay(50).animate({opacity: 1}, r.duration, "easeOutQuad", q.event.resetStyle).end().slideDown(100, "easeOutQuad", function () {
                                            c.proxy(q.event.resetStyle, this)();
                                            H()
                                        })
                                    } else {
                                        if (r.transition == "fade") {
                                            F.hide().clearQueue().fadeIn(r.duration, function () {
                                                c.proxy(q.event.resetStyle, this)();
                                                H()
                                            })
                                        } else {
                                            q.error(x.transition, r.transition)
                                        }
                                    }
                                }
                            }
                        }
                    }, hide: function (H, G) {
                        var F = G || p;
                        H = H || function () {
                            };
                        if (q.is.visible(F)) {
                            q.verbose("Doing menu hide animation", F);
                            if (c.fn.transition !== d && z.transition("is supported")) {
                                F.transition({
                                    animation: r.transition + " out",
                                    duration: r.duration,
                                    complete: H,
                                    queue: false
                                })
                            } else {
                                if (r.transition == "none") {
                                    H()
                                } else {
                                    if (r.transition == "slide down") {
                                        F.show().clearQueue().children().clearQueue().css("opacity", 1).animate({opacity: 0}, 100, "easeOutQuad", q.event.resetStyle).end().delay(50).slideUp(100, "easeOutQuad", function () {
                                            c.proxy(q.event.resetStyle, this)();
                                            H()
                                        })
                                    } else {
                                        if (r.transition == "fade") {
                                            F.show().clearQueue().fadeOut(150, function () {
                                                c.proxy(q.event.resetStyle, this)();
                                                H()
                                            })
                                        } else {
                                            q.error(x.transition)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }, show: function () {
                    q.debug("Checking if dropdown can show");
                    if (q.is.hidden()) {
                        q.hideOthers();
                        q.set.active();
                        q.animate.show(function () {
                            if (q.can.click()) {
                                q.bind.intent()
                            }
                            q.set.visible()
                        });
                        c.proxy(r.onShow, u)()
                    }
                }, hide: function () {
                    if (!q.is.animated() && q.is.visible()) {
                        q.debug("Hiding dropdown");
                        if (q.can.click()) {
                            q.unbind.intent()
                        }
                        q.remove.active();
                        q.animate.hide(q.remove.visible);
                        c.proxy(r.onHide, u)()
                    }
                }, delay: {
                    show: function () {
                        q.verbose("Delaying show event to ensure user intent");
                        clearTimeout(q.timer);
                        q.timer = setTimeout(q.show, r.delay.show)
                    }, hide: function () {
                        q.verbose("Delaying hide event to ensure user intent");
                        clearTimeout(q.timer);
                        q.timer = setTimeout(q.hide, r.delay.hide)
                    }
                }, hideOthers: function () {
                    q.verbose("Finding other dropdowns to hide");
                    m.not(z).has(t.menu + ":visible").dropdown("hide")
                }, toggle: function () {
                    q.verbose("Toggling menu visibility");
                    if (q.is.hidden()) {
                        q.show()
                    } else {
                        q.hide()
                    }
                }, setting: function (F, G) {
                    if (c.isPlainObject(F)) {
                        c.extend(true, r, F)
                    } else {
                        if (G !== d) {
                            r[F] = G
                        } else {
                            return r[F]
                        }
                    }
                }, internal: function (F, G) {
                    if (c.isPlainObject(F)) {
                        c.extend(true, q, F)
                    } else {
                        if (G !== d) {
                            q[F] = G
                        } else {
                            return q[F]
                        }
                    }
                }, debug: function () {
                    if (r.debug) {
                        if (r.performance) {
                            q.performance.log(arguments)
                        } else {
                            q.debug = Function.prototype.bind.call(console.info, console, r.name + ":");
                            q.debug.apply(console, arguments)
                        }
                    }
                }, verbose: function () {
                    if (r.verbose && r.debug) {
                        if (r.performance) {
                            q.performance.log(arguments)
                        } else {
                            q.verbose = Function.prototype.bind.call(console.info, console, r.name + ":");
                            q.verbose.apply(console, arguments)
                        }
                    }
                }, error: function () {
                    q.error = Function.prototype.bind.call(console.error, console, r.name + ":");
                    q.error.apply(console, arguments)
                }, performance: {
                    log: function (H) {
                        var G, I, F;
                        if (r.performance) {
                            G = new Date().getTime();
                            F = f || G;
                            I = G - F;
                            f = G;
                            l.push({Element: u, Name: H[0], Arguments: [].slice.call(H, 1) || "", "Execution Time": I})
                        }
                        clearTimeout(q.performance.timer);
                        q.performance.timer = setTimeout(q.performance.display, 100)
                    }, display: function () {
                        var G = r.name + ":", F = 0;
                        f = false;
                        clearTimeout(q.performance.timer);
                        c.each(l, function (H, I) {
                            F += I["Execution Time"]
                        });
                        G += " " + F + "ms";
                        if (j) {
                            G += " '" + j + "'"
                        }
                        if ((console.group !== d || console.table !== d) && l.length > 0) {
                            console.groupCollapsed(G);
                            if (console.table) {
                                console.table(l)
                            } else {
                                c.each(l, function (H, I) {
                                    console.log(I.Name + ": " + I["Execution Time"] + "ms")
                                })
                            }
                            console.groupEnd()
                        }
                        l = []
                    }
                }, invoke: function (K, G, I) {
                    var H = D, L, J, F;
                    G = G || n;
                    I = u || I;
                    if (typeof K == "string" && H !== d) {
                        K = K.split(/[\. ]/);
                        L = K.length - 1;
                        c.each(K, function (O, N) {
                            var M = (O != L) ? N + K[O + 1].charAt(0).toUpperCase() + K[O + 1].slice(1) : K;
                            if (c.isPlainObject(H[M]) && (O != L)) {
                                H = H[M]
                            } else {
                                if (H[M] !== d) {
                                    J = H[M];
                                    return false
                                } else {
                                    if (c.isPlainObject(H[N]) && (O != L)) {
                                        H = H[N]
                                    } else {
                                        if (H[N] !== d) {
                                            J = H[N];
                                            return false
                                        } else {
                                            q.error(x.method, K);
                                            return false
                                        }
                                    }
                                }
                            }
                        })
                    }
                    if (c.isFunction(J)) {
                        F = J.apply(I, G)
                    } else {
                        if (J !== d) {
                            F = J
                        }
                    }
                    if (c.isArray(g)) {
                        g.push(F)
                    } else {
                        if (g !== d) {
                            g = [g, F]
                        } else {
                            if (F !== d) {
                                g = F
                            }
                        }
                    }
                    return J
                }
            };
            if (e) {
                if (D === d) {
                    q.initialize()
                }
                q.invoke(k)
            } else {
                if (D !== d) {
                    q.destroy()
                }
                q.initialize()
            }
        });
        return (g) ? g : this
    };
    c.fn.dropdown.settings = {
        name: "Dropdown",
        namespace: "dropdown",
        verbose: false,
        debug: false,
        performance: true,
        on: "click",
        action: "activate",
        delay: {show: 200, hide: 300, touch: 50},
        transition: "slide down",
        duration: 250,
        onChange: function (e, f) {
        },
        onShow: function () {
        },
        onHide: function () {
        },
        error: {
            action: "You called a dropdown action that was not defined",
            method: "The method you called is not defined.",
            transition: "The requested transition was not found"
        },
        metadata: {defaultText: "defaultText", defaultValue: "defaultValue", text: "text", value: "value"},
        selector: {menu: ".menu", item: ".menu > .item", text: "> .text", input: '> input[type="hidden"]'},
        className: {
            active: "active",
            placeholder: "default",
            disabled: "disabled",
            visible: "visible",
            selection: "selection"
        }
    };
    c.extend(c.easing, {
        easeOutQuad: function (f, g, e, i, h) {
            return -i * (g /= h) * (g - 2) + e
        }
    })
})(jQuery, window, document);
/*
 * # Bootstrap - Popup
 * http://getbootstrap.com//
 */
+function (c) {
    var b = function (e, d) {
        this.type = this.options = this.enabled = this.timeout = this.hoverState = this.$element = null;
        this.init("tooltip", e, d)
    };
    b.DEFAULTS = {
        animation: true,
        placement: "top",
        selector: false,
        template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
        trigger: "hover focus",
        title: "",
        delay: 0,
        html: false,
        container: false
    };
    b.prototype.init = function (k, h, f) {
        this.enabled = true;
        this.type = k;
        this.$element = c(h);
        this.options = this.getOptions(f);
        var j = this.options.trigger.split(" ");
        for (var g = j.length; g--;) {
            var e = j[g];
            if (e == "click") {
                this.$element.on("click." + this.type, this.options.selector, c.proxy(this.toggle, this))
            } else {
                if (e != "manual") {
                    var l = e == "hover" ? "mouseenter" : "focus";
                    var d = e == "hover" ? "mouseleave" : "blur";
                    this.$element.on(l + "." + this.type, this.options.selector, c.proxy(this.enter, this));
                    this.$element.on(d + "." + this.type, this.options.selector, c.proxy(this.leave, this))
                }
            }
        }
        this.options.selector ? (this._options = c.extend({}, this.options, {
            trigger: "manual",
            selector: ""
        })) : this.fixTitle()
    };
    b.prototype.getDefaults = function () {
        return b.DEFAULTS
    };
    b.prototype.getOptions = function (d) {
        d = c.extend({}, this.getDefaults(), this.$element.data(), d);
        if (d.delay && typeof d.delay == "number") {
            d.delay = {show: d.delay, hide: d.delay}
        }
        return d
    };
    b.prototype.enter = function (g) {
        var f = this.getDefaults();
        var e = {};
        this._options && c.each(this._options, function (h, i) {
            if (f[h] != i) {
                e[h] = i
            }
        });
        var d = g instanceof this.constructor ? g : c(g.currentTarget)[this.type](e).data("bs." + this.type);
        clearTimeout(d.timeout);
        if (!d.options.delay || !d.options.delay.show) {
            return d.show()
        }
        d.hoverState = "in";
        d.timeout = setTimeout(function () {
            if (d.hoverState == "in") {
                d.show()
            }
        }, d.options.delay.show)
    };
    b.prototype.leave = function (e) {
        var d = e instanceof this.constructor ? e : c(e.currentTarget)[this.type](this._options).data("bs." + this.type);
        clearTimeout(d.timeout);
        if (!d.options.delay || !d.options.delay.hide) {
            return d.hide()
        }
        d.hoverState = "out";
        d.timeout = setTimeout(function () {
            if (d.hoverState == "out") {
                d.hide()
            }
        }, d.options.delay.hide)
    };
    b.prototype.show = function () {
        var n = c.Event("show.bs." + this.type);
        if (this.hasContent() && this.enabled) {
            this.$element.trigger(n);
            if (n.isDefaultPrevented()) {
                return
            }
            var j = this.tip();
            this.setContent();
            if (this.options.animation) {
                j.addClass("fade")
            }
            var i = typeof this.options.placement == "function" ? this.options.placement.call(this, j[0], this.$element[0]) : this.options.placement;
            var r = /\s?auto?\s?/i;
            var s = r.test(i);
            if (s) {
                i = i.replace(r, "") || "top"
            }
            j.detach().css({top: 0, left: 0, display: "block"}).addClass(i);
            this.options.container ? j.appendTo(this.options.container) : j.insertAfter(this.$element);
            var o = this.getPosition();
            var d = j[0].offsetWidth;
            var l = j[0].offsetHeight;
            if (s) {
                var h = this.$element.parent();
                var g = i;
                var p = document.documentElement.scrollTop || document.body.scrollTop;
                var q = this.options.container == "body" ? window.innerWidth : h.outerWidth();
                var m = this.options.container == "body" ? window.innerHeight : h.outerHeight();
                var k = this.options.container == "body" ? 0 : h.offset().left;
                i = i == "bottom" && o.top + o.height + l - p > m ? "top" : i == "top" && o.top - p - l < 0 ? "bottom" : i == "right" && o.right + d > q ? "left" : i == "left" && o.left - d < k ? "right" : i;
                j.removeClass(g).addClass(i)
            }
            var f = this.getCalcuatedOffset(i, o, d, l);
            this.applyPlacement(f, i);
            this.$element.trigger("shown.bs." + this.type)
        }
    };
    b.prototype.applyPlacement = function (i, j) {
        var g;
        var k = this.tip();
        var f = k[0].offsetWidth;
        var n = k[0].offsetHeight;
        var e = parseInt(k.css("margin-top"), 10);
        var h = parseInt(k.css("margin-left"), 10);
        if (isNaN(e)) {
            e = 0
        }
        if (isNaN(h)) {
            h = 0
        }
        i.top = i.top + e;
        i.left = i.left + h;
        k.offset(i).addClass("in");
        var d = k[0].offsetWidth;
        var l = k[0].offsetHeight;
        if (j == "top" && l != n) {
            g = true;
            i.top = i.top + n - l
        }
        if (/bottom|top/.test(j)) {
            var m = 0;
            if (i.left < 0) {
                m = i.left * -2;
                i.left = 0;
                k.offset(i);
                d = k[0].offsetWidth;
                l = k[0].offsetHeight
            }
            this.replaceArrow(m - f + d, d, "left")
        } else {
            this.replaceArrow(l - n, l, "top")
        }
        if (g) {
            k.offset(i)
        }
    };
    b.prototype.replaceArrow = function (f, e, d) {
        this.arrow().css(d, f ? (50 * (1 - f / e) + "%") : "")
    };
    b.prototype.setContent = function () {
        var e = this.tip();
        var d = this.getTitle();
        e.find(".tooltip-inner")[this.options.html ? "html" : "text"](d);
        e.removeClass("fade in top bottom left right")
    };
    b.prototype.hide = function () {
        var f = this;
        var h = this.tip();
        var g = c.Event("hide.bs." + this.type);

        function d() {
            h.detach()
        }

        this.$element.trigger(g);
        if (g.isDefaultPrevented()) {
            return
        }
        h.removeClass("in");
        c.support.transition && this.$tip.hasClass("fade") ? h.one(c.support.transition.end, d).emulateTransitionEnd(150) : d();
        this.$element.trigger("hidden.bs." + this.type);
        return this
    };
    b.prototype.fixTitle = function () {
        var d = this.$element;
        if (d.attr("title") || typeof(d.attr("data-original-title")) != "string") {
            d.attr("data-original-title", d.attr("title") || "").attr("title", "")
        }
    };
    b.prototype.hasContent = function () {
        return this.getTitle()
    };
    b.prototype.getPosition = function () {
        var d = this.$element[0];
        return c.extend({}, (typeof d.getBoundingClientRect == "function") ? d.getBoundingClientRect() : {
            width: d.offsetWidth,
            height: d.offsetHeight
        }, this.$element.offset())
    };
    b.prototype.getCalcuatedOffset = function (d, g, e, f) {
        return d == "bottom" ? {
            top: g.top + g.height,
            left: g.left + g.width / 2 - e / 2
        } : d == "top" ? {
            top: g.top - f,
            left: g.left + g.width / 2 - e / 2
        } : d == "left" ? {top: g.top + g.height / 2 - f / 2, left: g.left - e} : {
            top: g.top + g.height / 2 - f / 2,
            left: g.left + g.width
        }
    };
    b.prototype.getTitle = function () {
        var f;
        var d = this.$element;
        var e = this.options;
        f = d.attr("data-original-title") || (typeof e.title == "function" ? e.title.call(d[0]) : e.title);
        return f
    };
    b.prototype.tip = function () {
        return this.$tip = this.$tip || c(this.options.template)
    };
    b.prototype.arrow = function () {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    };
    b.prototype.validate = function () {
        if (!this.$element[0].parentNode) {
            this.hide();
            this.$element = null;
            this.options = null
        }
    };
    b.prototype.enable = function () {
        this.enabled = true
    };
    b.prototype.disable = function () {
        this.enabled = false
    };
    b.prototype.toggleEnabled = function () {
        this.enabled = !this.enabled
    };
    b.prototype.toggle = function (f) {
        var d = f ? c(f.currentTarget)[this.type](this._options).data("bs." + this.type) : this;
        d.tip().hasClass("in") ? d.leave(d) : d.enter(d)
    };
    b.prototype.destroy = function () {
        this.hide().$element.off("." + this.type).removeData("bs." + this.type)
    };
    var a = c.fn.tooltip;
    c.fn.tooltip = function (d) {
        return this.each(function () {
            var g = c(this);
            var f = g.data("bs.tooltip");
            var e = typeof d == "object" && d;
            if (!f) {
                g.data("bs.tooltip", (f = new b(this, e)))
            }
            if (typeof d == "string") {
                f[d]()
            }
        })
    };
    c.fn.tooltip.Constructor = b;
    c.fn.tooltip.noConflict = function () {
        c.fn.tooltip = a;
        return this
    }
}(window.jQuery);
+function (c) {
    var b = function (e, d) {
        this.init("popover", e, d)
    };
    if (!c.fn.tooltip) {
        throw new Error("Popover requires tooltip.js")
    }
    b.DEFAULTS = c.extend({}, c.fn.tooltip.Constructor.DEFAULTS, {
        placement: "right",
        trigger: "click",
        content: "",
        template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
    });
    b.prototype = c.extend({}, c.fn.tooltip.Constructor.prototype);
    b.prototype.constructor = b;
    b.prototype.getDefaults = function () {
        return b.DEFAULTS
    };
    b.prototype.setContent = function () {
        var f = this.tip();
        var e = this.getTitle();
        var d = this.getContent();
        f.find(".popover-title")[this.options.html ? "html" : "text"](e);
        f.find(".popover-content")[this.options.html ? "html" : "text"](d);
        f.removeClass("fade top bottom left right in");
        if (f.find(".popover-title").html() === "") {
            f.find(".popover-title").hide()
        }
    };
    b.prototype.hasContent = function () {
        return this.getTitle() || this.getContent()
    };
    b.prototype.getContent = function () {
        var d = this.$element;
        var e = this.options;
        return d.attr("data-content") || (typeof e.content == "function" ? e.content.call(d[0]) : e.content)
    };
    b.prototype.arrow = function () {
        return this.$arrow = this.$arrow || this.tip().find(".arrow")
    };
    b.prototype.tip = function () {
        if (!this.$tip) {
            this.$tip = c(this.options.template)
        }
        return this.$tip
    };
    var a = c.fn.popover;
    c.fn.popover = function (d) {
        return this.each(function () {
            var g = c(this);
            var f = g.data("bs.popover");
            var e = typeof d == "object" && d;
            if (!f) {
                g.data("bs.popover", (f = new b(this, e)))
            }
            if (typeof d == "string") {
                f[d]()
            }
        })
    };
    c.fn.popover.Constructor = b;
    c.fn.popover.noConflict = function () {
        c.fn.popover = a;
        return this
    }
}(window.jQuery);

/*
 * # Semantic - Sidebar
 * http://github.com/jlukic/semantic-ui/
 */
(function (c, b, a, d) {
    c.fn.sidebar = function (o) {
        var m = c(this), h = c("body"), i = c("head"), j = m.selector || "", f = new Date().getTime(), l = [], k = arguments[0], e = (typeof k == "string"), n = [].slice.call(arguments, 1), g;
        m.each(function () {
            var r = (c.isPlainObject(o)) ? c.extend(true, {}, c.fn.sidebar.settings, o) : c.extend({}, c.fn.sidebar.settings), t = r.selector, w = r.className, s = r.namespace, x = r.error, A = "." + s, v = "module-" + s, y = c(this), p = c("style[title=" + s + "]"), u = this, z = y.data(v), q;
            q = {
                initialize: function () {
                    q.debug("Initializing sidebar", y);
                    q.instantiate()
                }, instantiate: function () {
                    q.verbose("Storing instance of module", q);
                    z = q;
                    y.data(v, q)
                }, destroy: function () {
                    q.verbose("Destroying previous module for", y);
                    y.off(A).removeData(v)
                }, refresh: function () {
                    q.verbose("Refreshing selector cache");
                    p = c("style[title=" + s + "]")
                }, attachEvents: function (B, D) {
                    var C = c(B);
                    D = c.isFunction(q[D]) ? q[D] : q.toggle;
                    if (C.size() > 0) {
                        q.debug("Attaching sidebar events to element", B, D);
                        C.off(A).on("click" + A, D)
                    } else {
                        q.error(x.notFound)
                    }
                }, show: function (B) {
                    B = c.isFunction(B) ? B : function () {
                    };
                    q.debug("Showing sidebar", B);
                    if (q.is.closed()) {
                        if (!r.overlay) {
                            if (r.exclusive) {
                                q.hideAll()
                            }
                            q.pushPage()
                        }
                        q.set.active();
                        B();
                        c.proxy(r.onChange, u)();
                        c.proxy(r.onShow, u)()
                    } else {
                        q.debug("Sidebar is already visible")
                    }
                }, hide: function (B) {
                    B = c.isFunction(B) ? B : function () {
                    };
                    q.debug("Hiding sidebar", B);
                    if (q.is.open()) {
                        if (!r.overlay) {
                            q.pullPage();
                            q.remove.pushed()
                        }
                        q.remove.active();
                        B();
                        c.proxy(r.onChange, u)();
                        c.proxy(r.onHide, u)()
                    }
                }, hideAll: function () {
                    c(t.sidebar).filter(":visible").sidebar("hide")
                }, toggle: function () {
                    if (q.is.closed()) {
                        q.show()
                    } else {
                        q.hide()
                    }
                }, pushPage: function () {
                    var B = q.get.direction(), C = (q.is.vertical()) ? y.outerHeight() : y.outerWidth();
                    if (r.useCSS) {
                        q.debug("Using CSS to animate body");
                        q.add.bodyCSS(B, C);
                        q.set.pushed()
                    } else {
                        q.animatePage(B, C, q.set.pushed)
                    }
                }, pullPage: function () {
                    var B = q.get.direction();
                    if (r.useCSS) {
                        q.debug("Resetting body position css");
                        q.remove.bodyCSS()
                    } else {
                        q.debug("Resetting body position using javascript");
                        q.animatePage(B, 0)
                    }
                    q.remove.pushed()
                }, animatePage: function (B, D) {
                    var C = {};
                    C["padding-" + B] = D;
                    q.debug("Using javascript to animate body", C);
                    h.animate(C, r.duration, q.set.pushed)
                }, add: {
                    bodyCSS: function (C, D) {
                        var B;
                        if (C !== w.bottom) {
                            B = '<style title="' + s + '">body.pushed {  margin-' + C + ": " + D + "px;}</style>"
                        }
                        i.append(B);
                        q.debug("Adding body css to head", p)
                    }
                }, remove: {
                    bodyCSS: function () {
                        q.debug("Removing body css styles", p);
                        q.refresh();
                        p.remove()
                    }, active: function () {
                        y.removeClass(w.active)
                    }, pushed: function () {
                        q.verbose("Removing body push state", q.get.direction());
                        h.removeClass(w[q.get.direction()]).removeClass(w.pushed)
                    }
                }, set: {
                    active: function () {
                        y.addClass(w.active)
                    }, pushed: function () {
                        q.verbose("Adding body push state", q.get.direction());
                        h.addClass(w[q.get.direction()]).addClass(w.pushed)
                    }
                }, get: {
                    direction: function () {
                        if (y.hasClass(w.top)) {
                            return w.top
                        } else {
                            if (y.hasClass(w.right)) {
                                return w.right
                            } else {
                                if (y.hasClass(w.bottom)) {
                                    return w.bottom
                                } else {
                                    return w.left
                                }
                            }
                        }
                    }, transitionEvent: function () {
                        var B = a.createElement("element"), C = {
                            transition: "transitionend",
                            OTransition: "oTransitionEnd",
                            MozTransition: "transitionend",
                            WebkitTransition: "webkitTransitionEnd"
                        }, D;
                        for (D in C) {
                            if (B.style[D] !== d) {
                                return C[D]
                            }
                        }
                    }
                }, is: {
                    open: function () {
                        return y.is(":animated") || y.hasClass(w.active)
                    }, closed: function () {
                        return !q.is.open()
                    }, vertical: function () {
                        return y.hasClass(w.top)
                    }
                }, setting: function (B, C) {
                    if (c.isPlainObject(B)) {
                        c.extend(true, r, B)
                    } else {
                        if (C !== d) {
                            r[B] = C
                        } else {
                            return r[B]
                        }
                    }
                }, internal: function (B, C) {
                    if (c.isPlainObject(B)) {
                        c.extend(true, q, B)
                    } else {
                        if (C !== d) {
                            q[B] = C
                        } else {
                            return q[B]
                        }
                    }
                }, debug: function () {
                    if (r.debug) {
                        if (r.performance) {
                            q.performance.log(arguments)
                        } else {
                            q.debug = Function.prototype.bind.call(console.info, console, r.name + ":");
                            q.debug.apply(console, arguments)
                        }
                    }
                }, verbose: function () {
                    if (r.verbose && r.debug) {
                        if (r.performance) {
                            q.performance.log(arguments)
                        } else {
                            q.verbose = Function.prototype.bind.call(console.info, console, r.name + ":");
                            q.verbose.apply(console, arguments)
                        }
                    }
                }, error: function () {
                    q.error = Function.prototype.bind.call(console.error, console, r.name + ":");
                    q.error.apply(console, arguments)
                }, performance: {
                    log: function (D) {
                        var C, E, B;
                        if (r.performance) {
                            C = new Date().getTime();
                            B = f || C;
                            E = C - B;
                            f = C;
                            l.push({Element: u, Name: D[0], Arguments: [].slice.call(D, 1) || "", "Execution Time": E})
                        }
                        clearTimeout(q.performance.timer);
                        q.performance.timer = setTimeout(q.performance.display, 100)
                    }, display: function () {
                        var C = r.name + ":", B = 0;
                        f = false;
                        clearTimeout(q.performance.timer);
                        c.each(l, function (D, E) {
                            B += E["Execution Time"]
                        });
                        C += " " + B + "ms";
                        if (j) {
                            C += " '" + j + "'"
                        }
                        if (m.size() > 1) {
                            C += " (" + m.size() + ")"
                        }
                        if ((console.group !== d || console.table !== d) && l.length > 0) {
                            console.groupCollapsed(C);
                            if (console.table) {
                                console.table(l)
                            } else {
                                c.each(l, function (D, E) {
                                    console.log(E.Name + ": " + E["Execution Time"] + "ms")
                                })
                            }
                            console.groupEnd()
                        }
                        l = []
                    }
                }, invoke: function (G, C, E) {
                    var D = z, H, F, B;
                    C = C || n;
                    E = u || E;
                    if (typeof G == "string" && D !== d) {
                        G = G.split(/[\. ]/);
                        H = G.length - 1;
                        c.each(G, function (K, J) {
                            var I = (K != H) ? J + G[K + 1].charAt(0).toUpperCase() + G[K + 1].slice(1) : G;
                            if (c.isPlainObject(D[I]) && (K != H)) {
                                D = D[I]
                            } else {
                                if (D[I] !== d) {
                                    F = D[I];
                                    return false
                                } else {
                                    if (c.isPlainObject(D[J]) && (K != H)) {
                                        D = D[J]
                                    } else {
                                        if (D[J] !== d) {
                                            F = D[J];
                                            return false
                                        } else {
                                            return false
                                        }
                                    }
                                }
                            }
                        })
                    }
                    if (c.isFunction(F)) {
                        B = F.apply(E, C)
                    } else {
                        if (F !== d) {
                            B = F
                        }
                    }
                    if (c.isArray(g)) {
                        g.push(B)
                    } else {
                        if (g !== d) {
                            g = [g, B]
                        } else {
                            if (B !== d) {
                                g = B
                            }
                        }
                    }
                    return F
                }
            };
            if (e) {
                if (z === d) {
                    q.initialize()
                }
                q.invoke(k)
            } else {
                if (z !== d) {
                    q.destroy()
                }
                q.initialize()
            }
        });
        return (g !== d) ? g : this
    };
    c.fn.sidebar.settings = {
        name: "Sidebar",
        namespace: "sidebar",
        verbose: false,
        debug: false,
        performance: true,
        useCSS: true,
        exclusive: true,
        overlay: true,
        duration: 300,
        onChange: function () {
        },
        onShow: function () {
        },
        onHide: function () {
        },
        className: {active: "active", pushed: "pushed", top: "top", left: "left", right: "right", bottom: "bottom"},
        selector: {sidebar: ".wojo.sidebar"},
        error: {
            method: "The method you called is not defined.",
            notFound: "There were no elements that matched the specified selector"
        }
    }
})(jQuery, window, document);
/**!
 * easyPieChart
 * Lightweight plugin to render simple, animated and retina optimized pie charts
 *
 * @license
 * @author Robert Fleischmann <rendro87@gmail.com> (http://robert-fleischmann.de)
 * @version 2.1.5
 **/
!function (a, b) {
    "object" == typeof exports ? module.exports = b(require("jquery")) : "function" == typeof define && define.amd ? define(["jquery"], b) : b(a.jQuery)
}(this, function (a) {
    var b = function (a, b) {
        var c, d = document.createElement("canvas");
        a.appendChild(d), "undefined" != typeof G_vmlCanvasManager && G_vmlCanvasManager.initElement(d);
        var e = d.getContext("2d");
        d.width = d.height = b.size;
        var f = 1;
        window.devicePixelRatio > 1 && (f = window.devicePixelRatio, d.style.width = d.style.height = [b.size, "px"].join(""), d.width = d.height = b.size * f, e.scale(f, f)), e.translate(b.size / 2, b.size / 2), e.rotate((-0.5 + b.rotate / 180) * Math.PI);
        var g = (b.size - b.lineWidth) / 2;
        b.scaleColor && b.scaleLength && (g -= b.scaleLength + 2), Date.now = Date.now || function () {
                return +new Date
            };
        var h = function (a, b, c) {
            c = Math.min(Math.max(-1, c || 0), 1);
            var d = 0 >= c ? !0 : !1;
            e.beginPath(), e.arc(0, 0, g, 0, 2 * Math.PI * c, d), e.strokeStyle = a, e.lineWidth = b, e.stroke()
        }, i = function () {
            var a, c;
            e.lineWidth = 1, e.fillStyle = b.scaleColor, e.save();
            for (var d = 24; d > 0; --d)d % 6 === 0 ? (c = b.scaleLength, a = 0) : (c = .6 * b.scaleLength, a = b.scaleLength - c), e.fillRect(-b.size / 2 + a, 0, c, 1), e.rotate(Math.PI / 12);
            e.restore()
        }, j = function () {
            return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function (a) {
                    window.setTimeout(a, 1e3 / 60)
                }
        }(), k = function () {
            b.scaleColor && i(), b.trackColor && h(b.trackColor, b.lineWidth, 1)
        };
        this.getCanvas = function () {
            return d
        }, this.getCtx = function () {
            return e
        }, this.clear = function () {
            e.clearRect(b.size / -2, b.size / -2, b.size, b.size)
        }, this.draw = function (a) {
            b.scaleColor || b.trackColor ? e.getImageData && e.putImageData ? c ? e.putImageData(c, 0, 0) : (k(), c = e.getImageData(0, 0, b.size * f, b.size * f)) : (this.clear(), k()) : this.clear(), e.lineCap = b.lineCap;
            var d;
            d = "function" == typeof b.barColor ? b.barColor(a) : b.barColor, h(d, b.lineWidth, a / 100)
        }.bind(this), this.animate = function (a, c) {
            var d = Date.now();
            b.onStart(a, c);
            var e = function () {
                var f = Math.min(Date.now() - d, b.animate.duration), g = b.easing(this, f, a, c - a, b.animate.duration);
                this.draw(g), b.onStep(a, c, g), f >= b.animate.duration ? b.onStop(a, c) : j(e)
            }.bind(this);
            j(e)
        }.bind(this)
    }, c = function (a, c) {
        var d = {
            barColor: "#ef1e25",
            trackColor: "#f5f5f5",
            scaleColor: "#dfe0e0",
            scaleLength: 5,
            lineCap: "round",
            lineWidth: 3,
            size: 110,
            rotate: 0,
            animate: {duration: 1e3, enabled: !0},
            easing: function (a, b, c, d, e) {
                return b /= e / 2, 1 > b ? d / 2 * b * b + c : -d / 2 * (--b * (b - 2) - 1) + c
            },
            onStart: function () {
            },
            onStep: function () {
            },
            onStop: function () {
            }
        };
        if ("undefined" != typeof b)d.renderer = b; else {
            if ("undefined" == typeof SVGRenderer)throw new Error("Please load either the SVG- or the CanvasRenderer");
            d.renderer = SVGRenderer
        }
        var e = {}, f = 0, g = function () {
            this.el = a, this.options = e;
            for (var b in d)d.hasOwnProperty(b) && (e[b] = c && "undefined" != typeof c[b] ? c[b] : d[b], "function" == typeof e[b] && (e[b] = e[b].bind(this)));
            e.easing = "string" == typeof e.easing && "undefined" != typeof jQuery && jQuery.isFunction(jQuery.easing[e.easing]) ? jQuery.easing[e.easing] : d.easing, "number" == typeof e.animate && (e.animate = {
                duration: e.animate,
                enabled: !0
            }), "boolean" != typeof e.animate || e.animate || (e.animate = {
                duration: 1e3,
                enabled: e.animate
            }), this.renderer = new e.renderer(a, e), this.renderer.draw(f), a.dataset && a.dataset.percent ? this.update(parseFloat(a.dataset.percent)) : a.getAttribute && a.getAttribute("data-percent") && this.update(parseFloat(a.getAttribute("data-percent")))
        }.bind(this);
        this.update = function (a) {
            return a = parseFloat(a), e.animate.enabled ? this.renderer.animate(f, a) : this.renderer.draw(a), f = a, this
        }.bind(this), this.disableAnimation = function () {
            return e.animate.enabled = !1, this
        }, this.enableAnimation = function () {
            return e.animate.enabled = !0, this
        }, g()
    };
    a.fn.easyPieChart = function (b) {
        return this.each(function () {
            var d;
            a.data(this, "easyPieChart") || (d = a.extend({}, b, a(this).data()), a.data(this, "easyPieChart", new c(this, d)))
        })
    }
});
/*
 *  jQuery OwlCarousel v1.3.2
 *  Copyright (c) 2013 Bartosz Wojciechowski
 *  http://www.owlgraphic.com/owlcarousel/
 *  Licensed under MIT
 */
if (typeof Object.create !== "function") {
    Object.create = function (e) {
        function t() {
        }

        t.prototype = e;
        return new t
    }
}
(function (e, t, n) {
    var r = {
        init: function (t, n) {
            var r = this;
            r.$elem = e(n);
            r.options = e.extend({}, e.fn.owlCarousel.options, r.$elem.data(), t);
            r.userOptions = t;
            r.loadContent()
        }, loadContent: function () {
            function r(e) {
                var n, r = "";
                if (typeof t.options.jsonSuccess === "function") {
                    t.options.jsonSuccess.apply(this, [e])
                } else {
                    for (n in e.owl) {
                        if (e.owl.hasOwnProperty(n)) {
                            r += e.owl[n].item
                        }
                    }
                    t.$elem.html(r)
                }
                t.logIn()
            }

            var t = this, n;
            if (typeof t.options.beforeInit === "function") {
                t.options.beforeInit.apply(this, [t.$elem])
            }
            if (typeof t.options.jsonPath === "string") {
                n = t.options.jsonPath;
                e.getJSON(n, r)
            } else {
                t.logIn()
            }
        }, logIn: function () {
            var e = this;
            e.$elem.data("owl-originalStyles", e.$elem.attr("style")).data("owl-originalClasses", e.$elem.attr("class"));
            e.$elem.css({opacity: 0});
            e.orignalItems = e.options.items;
            e.checkBrowser();
            e.wrapperWidth = 0;
            e.checkVisible = null;
            e.setVars()
        }, setVars: function () {
            var e = this;
            if (e.$elem.children().length === 0) {
                return false
            }
            e.baseClass();
            e.eventTypes();
            e.$userItems = e.$elem.children();
            e.itemsAmount = e.$userItems.length;
            e.wrapItems();
            e.$owlItems = e.$elem.find(".owl-item");
            e.$owlWrapper = e.$elem.find(".owl-wrapper");
            e.playDirection = "next";
            e.prevItem = 0;
            e.prevArr = [0];
            e.currentItem = 0;
            e.customEvents();
            e.onStartup()
        }, onStartup: function () {
            var e = this;
            e.updateItems();
            e.calculateAll();
            e.buildControls();
            e.updateControls();
            e.response();
            e.moveEvents();
            e.stopOnHover();
            e.owlStatus();
            if (e.options.transitionStyle !== false) {
                e.transitionTypes(e.options.transitionStyle)
            }
            if (e.options.autoPlay === true) {
                e.options.autoPlay = 5e3
            }
            e.play();
            e.$elem.find(".owl-wrapper").css("display", "block");
            if (!e.$elem.is(":visible")) {
                e.watchVisibility()
            } else {
                e.$elem.css("opacity", 1)
            }
            e.onstartup = false;
            e.eachMoveUpdate();
            if (typeof e.options.afterInit === "function") {
                e.options.afterInit.apply(this, [e.$elem])
            }
        }, eachMoveUpdate: function () {
            var e = this;
            if (e.options.lazyLoad === true) {
                e.lazyLoad()
            }
            if (e.options.autoHeight === true) {
                e.autoHeight()
            }
            e.onVisibleItems();
            if (typeof e.options.afterAction === "function") {
                e.options.afterAction.apply(this, [e.$elem])
            }
        }, updateVars: function () {
            var e = this;
            if (typeof e.options.beforeUpdate === "function") {
                e.options.beforeUpdate.apply(this, [e.$elem])
            }
            e.watchVisibility();
            e.updateItems();
            e.calculateAll();
            e.updatePosition();
            e.updateControls();
            e.eachMoveUpdate();
            if (typeof e.options.afterUpdate === "function") {
                e.options.afterUpdate.apply(this, [e.$elem])
            }
        }, reload: function () {
            var e = this;
            t.setTimeout(function () {
                e.updateVars()
            }, 0)
        }, watchVisibility: function () {
            var e = this;
            if (e.$elem.is(":visible") === false) {
                e.$elem.css({opacity: 0});
                t.clearInterval(e.autoPlayInterval);
                t.clearInterval(e.checkVisible)
            } else {
                return false
            }
            e.checkVisible = t.setInterval(function () {
                if (e.$elem.is(":visible")) {
                    e.reload();
                    e.$elem.animate({opacity: 1}, 200);
                    t.clearInterval(e.checkVisible)
                }
            }, 500)
        }, wrapItems: function () {
            var e = this;
            e.$userItems.wrapAll('<div class="owl-wrapper">').wrap('<div class="owl-item"></div>');
            e.$elem.find(".owl-wrapper").wrap('<div class="owl-wrapper-outer">');
            e.wrapperOuter = e.$elem.find(".owl-wrapper-outer");
            e.$elem.css("display", "block")
        }, baseClass: function () {
            var e = this, t = e.$elem.hasClass(e.options.baseClass), n = e.$elem.hasClass(e.options.theme);
            if (!t) {
                e.$elem.addClass(e.options.baseClass)
            }
            if (!n) {
                e.$elem.addClass(e.options.theme)
            }
        }, updateItems: function () {
            var t = this, n, r;
            if (t.options.responsive === false) {
                return false
            }
            if (t.options.singleItem === true) {
                t.options.items = t.orignalItems = 1;
                t.options.itemsCustom = false;
                t.options.itemsDesktop = false;
                t.options.itemsDesktopSmall = false;
                t.options.itemsTablet = false;
                t.options.itemsTabletSmall = false;
                t.options.itemsMobile = false;
                return false
            }
            n = e(t.options.responsiveBaseWidth).width();
            if (n > (t.options.itemsDesktop[0] || t.orignalItems)) {
                t.options.items = t.orignalItems
            }
            if (t.options.itemsCustom !== false) {
                t.options.itemsCustom.sort(function (e, t) {
                    return e[0] - t[0]
                });
                for (r = 0; r < t.options.itemsCustom.length; r += 1) {
                    if (t.options.itemsCustom[r][0] <= n) {
                        t.options.items = t.options.itemsCustom[r][1]
                    }
                }
            } else {
                if (n <= t.options.itemsDesktop[0] && t.options.itemsDesktop !== false) {
                    t.options.items = t.options.itemsDesktop[1]
                }
                if (n <= t.options.itemsDesktopSmall[0] && t.options.itemsDesktopSmall !== false) {
                    t.options.items = t.options.itemsDesktopSmall[1]
                }
                if (n <= t.options.itemsTablet[0] && t.options.itemsTablet !== false) {
                    t.options.items = t.options.itemsTablet[1]
                }
                if (n <= t.options.itemsTabletSmall[0] && t.options.itemsTabletSmall !== false) {
                    t.options.items = t.options.itemsTabletSmall[1]
                }
                if (n <= t.options.itemsMobile[0] && t.options.itemsMobile !== false) {
                    t.options.items = t.options.itemsMobile[1]
                }
            }
            if (t.options.items > t.itemsAmount && t.options.itemsScaleUp === true) {
                t.options.items = t.itemsAmount
            }
        }, response: function () {
            var n = this, r, i;
            if (n.options.responsive !== true) {
                return false
            }
            i = e(t).width();
            n.resizer = function () {
                if (e(t).width() !== i) {
                    if (n.options.autoPlay !== false) {
                        t.clearInterval(n.autoPlayInterval)
                    }
                    t.clearTimeout(r);
                    r = t.setTimeout(function () {
                        i = e(t).width();
                        n.updateVars()
                    }, n.options.responsiveRefreshRate)
                }
            };
            e(t).resize(n.resizer)
        }, updatePosition: function () {
            var e = this;
            e.jumpTo(e.currentItem);
            if (e.options.autoPlay !== false) {
                e.checkAp()
            }
        }, appendItemsSizes: function () {
            var t = this, n = 0, r = t.itemsAmount - t.options.items;
            t.$owlItems.each(function (i) {
                var s = e(this);
                s.css({width: t.itemWidth}).data("owl-item", Number(i));
                if (i % t.options.items === 0 || i === r) {
                    if (!(i > r)) {
                        n += 1
                    }
                }
                s.data("owl-roundPages", n)
            })
        }, appendWrapperSizes: function () {
            var e = this, t = e.$owlItems.length * e.itemWidth;
            e.$owlWrapper.css({width: t * 2, left: 0});
            e.appendItemsSizes()
        }, calculateAll: function () {
            var e = this;
            e.calculateWidth();
            e.appendWrapperSizes();
            e.loops();
            e.max()
        }, calculateWidth: function () {
            var e = this;
            e.itemWidth = Math.round(e.$elem.width() / e.options.items)
        }, max: function () {
            var e = this, t = (e.itemsAmount * e.itemWidth - e.options.items * e.itemWidth) * -1;
            if (e.options.items > e.itemsAmount) {
                e.maximumItem = 0;
                t = 0;
                e.maximumPixels = 0
            } else {
                e.maximumItem = e.itemsAmount - e.options.items;
                e.maximumPixels = t
            }
            return t
        }, min: function () {
            return 0
        }, loops: function () {
            var t = this, n = 0, r = 0, i, s, o;
            t.positionsInArray = [0];
            t.pagesInArray = [];
            for (i = 0; i < t.itemsAmount; i += 1) {
                r += t.itemWidth;
                t.positionsInArray.push(-r);
                if (t.options.scrollPerPage === true) {
                    s = e(t.$owlItems[i]);
                    o = s.data("owl-roundPages");
                    if (o !== n) {
                        t.pagesInArray[n] = t.positionsInArray[i];
                        n = o
                    }
                }
            }
        }, buildControls: function () {
            var t = this;
            if (t.options.navigation === true || t.options.pagination === true) {
                t.owlControls = e('<div class="owl-controls"/>').toggleClass("clickable", !t.browser.isTouch).appendTo(t.$elem)
            }
            if (t.options.pagination === true) {
                t.buildPagination()
            }
            if (t.options.navigation === true) {
                t.buildButtons()
            }
        }, buildButtons: function () {
            var t = this, n = e('<div class="owl-buttons"/>');
            t.owlControls.append(n);
            t.buttonPrev = e("<div/>", {"class": "owl-prev", html: t.options.navigationText[0] || ""});
            t.buttonNext = e("<div/>", {"class": "owl-next", html: t.options.navigationText[1] || ""});
            n.append(t.buttonPrev).append(t.buttonNext);
            n.on("touchstart.owlControls mousedown.owlControls", 'div[class^="owl"]', function (e) {
                e.preventDefault()
            });
            n.on("touchend.owlControls mouseup.owlControls", 'div[class^="owl"]', function (n) {
                n.preventDefault();
                if (e(this).hasClass("owl-next")) {
                    t.next()
                } else {
                    t.prev()
                }
            })
        }, buildPagination: function () {
            var t = this;
            t.paginationWrapper = e('<div class="owl-pagination"/>');
            t.owlControls.append(t.paginationWrapper);
            t.paginationWrapper.on("touchend.owlControls mouseup.owlControls", ".owl-page", function (n) {
                n.preventDefault();
                if (Number(e(this).data("owl-page")) !== t.currentItem) {
                    t.goTo(Number(e(this).data("owl-page")), true)
                }
            })
        }, updatePagination: function () {
            var t = this, n, r, i, s, o, u;
            if (t.options.pagination === false) {
                return false
            }
            t.paginationWrapper.html("");
            n = 0;
            r = t.itemsAmount - t.itemsAmount % t.options.items;
            for (s = 0; s < t.itemsAmount; s += 1) {
                if (s % t.options.items === 0) {
                    n += 1;
                    if (r === s) {
                        i = t.itemsAmount - t.options.items
                    }
                    o = e("<div/>", {"class": "owl-page"});
                    u = e("<span></span>", {
                        text: t.options.paginationNumbers === true ? n : "",
                        "class": t.options.paginationNumbers === true ? "owl-numbers" : ""
                    });
                    o.append(u);
                    o.data("owl-page", r === s ? i : s);
                    o.data("owl-roundPages", n);
                    t.paginationWrapper.append(o)
                }
            }
            t.checkPagination()
        }, checkPagination: function () {
            var t = this;
            if (t.options.pagination === false) {
                return false
            }
            t.paginationWrapper.find(".owl-page").each(function () {
                if (e(this).data("owl-roundPages") === e(t.$owlItems[t.currentItem]).data("owl-roundPages")) {
                    t.paginationWrapper.find(".owl-page").removeClass("active");
                    e(this).addClass("active")
                }
            })
        }, checkNavigation: function () {
            var e = this;
            if (e.options.navigation === false) {
                return false
            }
            if (e.options.rewindNav === false) {
                if (e.currentItem === 0 && e.maximumItem === 0) {
                    e.buttonPrev.addClass("disabled");
                    e.buttonNext.addClass("disabled")
                } else if (e.currentItem === 0 && e.maximumItem !== 0) {
                    e.buttonPrev.addClass("disabled");
                    e.buttonNext.removeClass("disabled")
                } else if (e.currentItem === e.maximumItem) {
                    e.buttonPrev.removeClass("disabled");
                    e.buttonNext.addClass("disabled")
                } else if (e.currentItem !== 0 && e.currentItem !== e.maximumItem) {
                    e.buttonPrev.removeClass("disabled");
                    e.buttonNext.removeClass("disabled")
                }
            }
        }, updateControls: function () {
            var e = this;
            e.updatePagination();
            e.checkNavigation();
            if (e.owlControls) {
                if (e.options.items >= e.itemsAmount) {
                    e.owlControls.hide()
                } else {
                    e.owlControls.show()
                }
            }
        }, destroyControls: function () {
            var e = this;
            if (e.owlControls) {
                e.owlControls.remove()
            }
        }, next: function (e) {
            var t = this;
            if (t.isTransition) {
                return false
            }
            t.currentItem += t.options.scrollPerPage === true ? t.options.items : 1;
            if (t.currentItem > t.maximumItem + (t.options.scrollPerPage === true ? t.options.items - 1 : 0)) {
                if (t.options.rewindNav === true) {
                    t.currentItem = 0;
                    e = "rewind"
                } else {
                    t.currentItem = t.maximumItem;
                    return false
                }
            }
            t.goTo(t.currentItem, e)
        }, prev: function (e) {
            var t = this;
            if (t.isTransition) {
                return false
            }
            if (t.options.scrollPerPage === true && t.currentItem > 0 && t.currentItem < t.options.items) {
                t.currentItem = 0
            } else {
                t.currentItem -= t.options.scrollPerPage === true ? t.options.items : 1
            }
            if (t.currentItem < 0) {
                if (t.options.rewindNav === true) {
                    t.currentItem = t.maximumItem;
                    e = "rewind"
                } else {
                    t.currentItem = 0;
                    return false
                }
            }
            t.goTo(t.currentItem, e)
        }, goTo: function (e, n, r) {
            var i = this, s;
            if (i.isTransition) {
                return false
            }
            if (typeof i.options.beforeMove === "function") {
                i.options.beforeMove.apply(this, [i.$elem])
            }
            if (e >= i.maximumItem) {
                e = i.maximumItem
            } else if (e <= 0) {
                e = 0
            }
            i.currentItem = i.owl.currentItem = e;
            if (i.options.transitionStyle !== false && r !== "drag" && i.options.items === 1 && i.browser.support3d === true) {
                i.swapSpeed(0);
                if (i.browser.support3d === true) {
                    i.transition3d(i.positionsInArray[e])
                } else {
                    i.css2slide(i.positionsInArray[e], 1)
                }
                i.afterGo();
                i.singleItemTransition();
                return false
            }
            s = i.positionsInArray[e];
            if (i.browser.support3d === true) {
                i.isCss3Finish = false;
                if (n === true) {
                    i.swapSpeed("paginationSpeed");
                    t.setTimeout(function () {
                        i.isCss3Finish = true
                    }, i.options.paginationSpeed)
                } else if (n === "rewind") {
                    i.swapSpeed(i.options.rewindSpeed);
                    t.setTimeout(function () {
                        i.isCss3Finish = true
                    }, i.options.rewindSpeed)
                } else {
                    i.swapSpeed("slideSpeed");
                    t.setTimeout(function () {
                        i.isCss3Finish = true
                    }, i.options.slideSpeed)
                }
                i.transition3d(s)
            } else {
                if (n === true) {
                    i.css2slide(s, i.options.paginationSpeed)
                } else if (n === "rewind") {
                    i.css2slide(s, i.options.rewindSpeed)
                } else {
                    i.css2slide(s, i.options.slideSpeed)
                }
            }
            i.afterGo()
        }, jumpTo: function (e) {
            var t = this;
            if (typeof t.options.beforeMove === "function") {
                t.options.beforeMove.apply(this, [t.$elem])
            }
            if (e >= t.maximumItem || e === -1) {
                e = t.maximumItem
            } else if (e <= 0) {
                e = 0
            }
            t.swapSpeed(0);
            if (t.browser.support3d === true) {
                t.transition3d(t.positionsInArray[e])
            } else {
                t.css2slide(t.positionsInArray[e], 1)
            }
            t.currentItem = t.owl.currentItem = e;
            t.afterGo()
        }, afterGo: function () {
            var e = this;
            e.prevArr.push(e.currentItem);
            e.prevItem = e.owl.prevItem = e.prevArr[e.prevArr.length - 2];
            e.prevArr.shift(0);
            if (e.prevItem !== e.currentItem) {
                e.checkPagination();
                e.checkNavigation();
                e.eachMoveUpdate();
                if (e.options.autoPlay !== false) {
                    e.checkAp()
                }
            }
            if (typeof e.options.afterMove === "function" && e.prevItem !== e.currentItem) {
                e.options.afterMove.apply(this, [e.$elem])
            }
        }, stop: function () {
            var e = this;
            e.apStatus = "stop";
            t.clearInterval(e.autoPlayInterval)
        }, checkAp: function () {
            var e = this;
            if (e.apStatus !== "stop") {
                e.play()
            }
        }, play: function () {
            var e = this;
            e.apStatus = "play";
            if (e.options.autoPlay === false) {
                return false
            }
            t.clearInterval(e.autoPlayInterval);
            e.autoPlayInterval = t.setInterval(function () {
                e.next(true)
            }, e.options.autoPlay)
        }, swapSpeed: function (e) {
            var t = this;
            if (e === "slideSpeed") {
                t.$owlWrapper.css(t.addCssSpeed(t.options.slideSpeed))
            } else if (e === "paginationSpeed") {
                t.$owlWrapper.css(t.addCssSpeed(t.options.paginationSpeed))
            } else if (typeof e !== "string") {
                t.$owlWrapper.css(t.addCssSpeed(e))
            }
        }, addCssSpeed: function (e) {
            return {
                "-webkit-transition": "all " + e + "ms ease",
                "-moz-transition": "all " + e + "ms ease",
                "-o-transition": "all " + e + "ms ease",
                transition: "all " + e + "ms ease"
            }
        }, removeTransition: function () {
            return {"-webkit-transition": "", "-moz-transition": "", "-o-transition": "", transition: ""}
        }, doTranslate: function (e) {
            return {
                "-webkit-transform": "translate3d(" + e + "px, 0px, 0px)",
                "-moz-transform": "translate3d(" + e + "px, 0px, 0px)",
                "-o-transform": "translate3d(" + e + "px, 0px, 0px)",
                "-ms-transform": "translate3d(" + e + "px, 0px, 0px)",
                transform: "translate3d(" + e + "px, 0px,0px)"
            }
        }, transition3d: function (e) {
            var t = this;
            t.$owlWrapper.css(t.doTranslate(e))
        }, css2move: function (e) {
            var t = this;
            t.$owlWrapper.css({left: e})
        }, css2slide: function (e, t) {
            var n = this;
            n.isCssFinish = false;
            n.$owlWrapper.stop(true, true).animate({left: e}, {
                duration: t || n.options.slideSpeed, complete: function () {
                    n.isCssFinish = true
                }
            })
        }, checkBrowser: function () {
            var e = this, r = "translate3d(0px, 0px, 0px)", i = n.createElement("div"), s, o, u, a;
            i.style.cssText = "  -moz-transform:" + r + "; -ms-transform:" + r + "; -o-transform:" + r + "; -webkit-transform:" + r + "; transform:" + r;
            s = /translate3d\(0px, 0px, 0px\)/g;
            o = i.style.cssText.match(s);
            u = o !== null && o.length === 1;
            a = "ontouchstart" in t || t.navigator.msMaxTouchPoints;
            e.browser = {support3d: u, isTouch: a}
        }, moveEvents: function () {
            var e = this;
            if (e.options.mouseDrag !== false || e.options.touchDrag !== false) {
                e.gestures();
                e.disabledEvents()
            }
        }, eventTypes: function () {
            var e = this, t = ["s", "e", "x"];
            e.ev_types = {};
            if (e.options.mouseDrag === true && e.options.touchDrag === true) {
                t = ["touchstart.owl mousedown.owl", "touchmove.owl mousemove.owl", "touchend.owl touchcancel.owl mouseup.owl"]
            } else if (e.options.mouseDrag === false && e.options.touchDrag === true) {
                t = ["touchstart.owl", "touchmove.owl", "touchend.owl touchcancel.owl"]
            } else if (e.options.mouseDrag === true && e.options.touchDrag === false) {
                t = ["mousedown.owl", "mousemove.owl", "mouseup.owl"]
            }
            e.ev_types.start = t[0];
            e.ev_types.move = t[1];
            e.ev_types.end = t[2]
        }, disabledEvents: function () {
            var t = this;
            t.$elem.on("dragstart.owl", function (e) {
                e.preventDefault()
            });
            t.$elem.on("mousedown.disableTextSelect", function (t) {
                return e(t.target).is("input, textarea, select, option")
            })
        }, gestures: function () {
            function s(e) {
                if (e.touches !== undefined) {
                    return {x: e.touches[0].pageX, y: e.touches[0].pageY}
                }
                if (e.touches === undefined) {
                    if (e.pageX !== undefined) {
                        return {x: e.pageX, y: e.pageY}
                    }
                    if (e.pageX === undefined) {
                        return {x: e.clientX, y: e.clientY}
                    }
                }
            }

            function o(t) {
                if (t === "on") {
                    e(n).on(r.ev_types.move, a);
                    e(n).on(r.ev_types.end, f)
                } else if (t === "off") {
                    e(n).off(r.ev_types.move);
                    e(n).off(r.ev_types.end)
                }
            }

            function u(n) {
                var u = n.originalEvent || n || t.event, a;
                if (u.which === 3) {
                    return false
                }
                if (r.itemsAmount <= r.options.items) {
                    return
                }
                if (r.isCssFinish === false && !r.options.dragBeforeAnimFinish) {
                    return false
                }
                if (r.isCss3Finish === false && !r.options.dragBeforeAnimFinish) {
                    return false
                }
                if (r.options.autoPlay !== false) {
                    t.clearInterval(r.autoPlayInterval)
                }
                if (r.browser.isTouch !== true && !r.$owlWrapper.hasClass("grabbing")) {
                    r.$owlWrapper.addClass("grabbing")
                }
                r.newPosX = 0;
                r.newRelativeX = 0;
                e(this).css(r.removeTransition());
                a = e(this).position();
                i.relativePos = a.left;
                i.offsetX = s(u).x - a.left;
                i.offsetY = s(u).y - a.top;
                o("on");
                i.sliding = false;
                i.targetElement = u.target || u.srcElement
            }

            function a(o) {
                var u = o.originalEvent || o || t.event, a, f;
                r.newPosX = s(u).x - i.offsetX;
                r.newPosY = s(u).y - i.offsetY;
                r.newRelativeX = r.newPosX - i.relativePos;
                if (typeof r.options.startDragging === "function" && i.dragging !== true && r.newRelativeX !== 0) {
                    i.dragging = true;
                    r.options.startDragging.apply(r, [r.$elem])
                }
                if ((r.newRelativeX > 8 || r.newRelativeX < -8) && r.browser.isTouch === true) {
                    if (u.preventDefault !== undefined) {
                        u.preventDefault()
                    } else {
                        u.returnValue = false
                    }
                    i.sliding = true
                }
                if ((r.newPosY > 10 || r.newPosY < -10) && i.sliding === false) {
                    e(n).off("touchmove.owl")
                }
                a = function () {
                    return r.newRelativeX / 5
                };
                f = function () {
                    return r.maximumPixels + r.newRelativeX / 5
                };
                r.newPosX = Math.max(Math.min(r.newPosX, a()), f());
                if (r.browser.support3d === true) {
                    r.transition3d(r.newPosX)
                } else {
                    r.css2move(r.newPosX)
                }
            }

            function f(n) {
                var s = n.originalEvent || n || t.event, u, a, f;
                s.target = s.target || s.srcElement;
                i.dragging = false;
                if (r.browser.isTouch !== true) {
                    r.$owlWrapper.removeClass("grabbing")
                }
                if (r.newRelativeX < 0) {
                    r.dragDirection = r.owl.dragDirection = "left"
                } else {
                    r.dragDirection = r.owl.dragDirection = "right"
                }
                if (r.newRelativeX !== 0) {
                    u = r.getNewPosition();
                    r.goTo(u, false, "drag");
                    if (i.targetElement === s.target && r.browser.isTouch !== true) {
                        e(s.target).on("click.disable", function (t) {
                            t.stopImmediatePropagation();
                            t.stopPropagation();
                            t.preventDefault();
                            e(t.target).off("click.disable")
                        });
                        a = e._data(s.target, "events").click;
                        f = a.pop();
                        a.splice(0, 0, f)
                    }
                }
                o("off")
            }

            var r = this, i = {
                offsetX: 0,
                offsetY: 0,
                baseElWidth: 0,
                relativePos: 0,
                position: null,
                minSwipe: null,
                maxSwipe: null,
                sliding: null,
                dargging: null,
                targetElement: null
            };
            r.isCssFinish = true;
            r.$elem.on(r.ev_types.start, ".owl-wrapper", u)
        }, getNewPosition: function () {
            var e = this, t = e.closestItem();
            if (t > e.maximumItem) {
                e.currentItem = e.maximumItem;
                t = e.maximumItem
            } else if (e.newPosX >= 0) {
                t = 0;
                e.currentItem = 0
            }
            return t
        }, closestItem: function () {
            var t = this, n = t.options.scrollPerPage === true ? t.pagesInArray : t.positionsInArray, r = t.newPosX, i = null;
            e.each(n, function (s, o) {
                if (r - t.itemWidth / 20 > n[s + 1] && r - t.itemWidth / 20 < o && t.moveDirection() === "left") {
                    i = o;
                    if (t.options.scrollPerPage === true) {
                        t.currentItem = e.inArray(i, t.positionsInArray)
                    } else {
                        t.currentItem = s
                    }
                } else if (r + t.itemWidth / 20 < o && r + t.itemWidth / 20 > (n[s + 1] || n[s] - t.itemWidth) && t.moveDirection() === "right") {
                    if (t.options.scrollPerPage === true) {
                        i = n[s + 1] || n[n.length - 1];
                        t.currentItem = e.inArray(i, t.positionsInArray)
                    } else {
                        i = n[s + 1];
                        t.currentItem = s + 1
                    }
                }
            });
            return t.currentItem
        }, moveDirection: function () {
            var e = this, t;
            if (e.newRelativeX < 0) {
                t = "right";
                e.playDirection = "next"
            } else {
                t = "left";
                e.playDirection = "prev"
            }
            return t
        }, customEvents: function () {
            var e = this;
            e.$elem.on("owl.next", function () {
                e.next()
            });
            e.$elem.on("owl.prev", function () {
                e.prev()
            });
            e.$elem.on("owl.play", function (t, n) {
                e.options.autoPlay = n;
                e.play();
                e.hoverStatus = "play"
            });
            e.$elem.on("owl.stop", function () {
                e.stop();
                e.hoverStatus = "stop"
            });
            e.$elem.on("owl.goTo", function (t, n) {
                e.goTo(n)
            });
            e.$elem.on("owl.jumpTo", function (t, n) {
                e.jumpTo(n)
            })
        }, stopOnHover: function () {
            var e = this;
            if (e.options.stopOnHover === true && e.browser.isTouch !== true && e.options.autoPlay !== false) {
                e.$elem.on("mouseover", function () {
                    e.stop()
                });
                e.$elem.on("mouseout", function () {
                    if (e.hoverStatus !== "stop") {
                        e.play()
                    }
                })
            }
        }, lazyLoad: function () {
            var t = this, n, r, i, s, o;
            if (t.options.lazyLoad === false) {
                return false
            }
            for (n = 0; n < t.itemsAmount; n += 1) {
                r = e(t.$owlItems[n]);
                if (r.data("owl-loaded") === "loaded") {
                    continue
                }
                i = r.data("owl-item");
                s = r.find(".lazyOwl");
                if (typeof s.data("src") !== "string") {
                    r.data("owl-loaded", "loaded");
                    continue
                }
                if (r.data("owl-loaded") === undefined) {
                    s.hide();
                    r.addClass("loading").data("owl-loaded", "checked")
                }
                if (t.options.lazyFollow === true) {
                    o = i >= t.currentItem
                } else {
                    o = true
                }
                if (o && i < t.currentItem + t.options.items && s.length) {
                    t.lazyPreload(r, s)
                }
            }
        }, lazyPreload: function (e, n) {
            function o() {
                e.data("owl-loaded", "loaded").removeClass("loading");
                n.removeAttr("data-src");
                if (r.options.lazyEffect === "fade") {
                    n.fadeIn(400)
                } else {
                    n.show()
                }
                if (typeof r.options.afterLazyLoad === "function") {
                    r.options.afterLazyLoad.apply(this, [r.$elem])
                }
            }

            function u() {
                i += 1;
                if (r.completeImg(n.get(0)) || s === true) {
                    o()
                } else if (i <= 100) {
                    t.setTimeout(u, 100)
                } else {
                    o()
                }
            }

            var r = this, i = 0, s;
            if (n.prop("tagName") === "DIV") {
                n.css("background-image", "url(" + n.data("src") + ")");
                s = true
            } else {
                n[0].src = n.data("src")
            }
            u()
        }, autoHeight: function () {
            function s() {
                var r = e(n.$owlItems[n.currentItem]).height();
                n.wrapperOuter.css("height", r + "px");
                if (!n.wrapperOuter.hasClass("autoHeight")) {
                    t.setTimeout(function () {
                        n.wrapperOuter.addClass("autoHeight")
                    }, 0)
                }
            }

            function o() {
                i += 1;
                if (n.completeImg(r.get(0))) {
                    s()
                } else if (i <= 100) {
                    t.setTimeout(o, 100)
                } else {
                    n.wrapperOuter.css("height", "")
                }
            }

            var n = this, r = e(n.$owlItems[n.currentItem]).find("img"), i;
            if (r.get(0) !== undefined) {
                i = 0;
                o()
            } else {
                s()
            }
        }, completeImg: function (e) {
            var t;
            if (!e.complete) {
                return false
            }
            t = typeof e.naturalWidth;
            if (t !== "undefined" && e.naturalWidth === 0) {
                return false
            }
            return true
        }, onVisibleItems: function () {
            var t = this, n;
            if (t.options.addClassActive === true) {
                t.$owlItems.removeClass("active")
            }
            t.visibleItems = [];
            for (n = t.currentItem; n < t.currentItem + t.options.items; n += 1) {
                t.visibleItems.push(n);
                if (t.options.addClassActive === true) {
                    e(t.$owlItems[n]).addClass("active")
                }
            }
            t.owl.visibleItems = t.visibleItems
        }, transitionTypes: function (e) {
            var t = this;
            t.outClass = "owl-" + e + "-out";
            t.inClass = "owl-" + e + "-in"
        }, singleItemTransition: function () {
            function a(e) {
                return {position: "relative", left: e + "px"}
            }

            var e = this, t = e.outClass, n = e.inClass, r = e.$owlItems.eq(e.currentItem), i = e.$owlItems.eq(e.prevItem), s = Math.abs(e.positionsInArray[e.currentItem]) + e.positionsInArray[e.prevItem], o = Math.abs(e.positionsInArray[e.currentItem]) + e.itemWidth / 2, u = "webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend";
            e.isTransition = true;
            e.$owlWrapper.addClass("owl-origin").css({
                "-webkit-transform-origin": o + "px",
                "-moz-perspective-origin": o + "px",
                "perspective-origin": o + "px"
            });
            i.css(a(s, 10)).addClass(t).on(u, function () {
                e.endPrev = true;
                i.off(u);
                e.clearTransStyle(i, t)
            });
            r.addClass(n).on(u, function () {
                e.endCurrent = true;
                r.off(u);
                e.clearTransStyle(r, n)
            })
        }, clearTransStyle: function (e, t) {
            var n = this;
            e.css({position: "", left: ""}).removeClass(t);
            if (n.endPrev && n.endCurrent) {
                n.$owlWrapper.removeClass("owl-origin");
                n.endPrev = false;
                n.endCurrent = false;
                n.isTransition = false
            }
        }, owlStatus: function () {
            var e = this;
            e.owl = {
                userOptions: e.userOptions,
                baseElement: e.$elem,
                userItems: e.$userItems,
                owlItems: e.$owlItems,
                currentItem: e.currentItem,
                prevItem: e.prevItem,
                visibleItems: e.visibleItems,
                isTouch: e.browser.isTouch,
                browser: e.browser,
                dragDirection: e.dragDirection
            }
        }, clearEvents: function () {
            var r = this;
            r.$elem.off(".owl owl mousedown.disableTextSelect");
            e(n).off(".owl owl");
            e(t).off("resize", r.resizer)
        }, unWrap: function () {
            var e = this;
            if (e.$elem.children().length !== 0) {
                e.$owlWrapper.unwrap();
                e.$userItems.unwrap().unwrap();
                if (e.owlControls) {
                    e.owlControls.remove()
                }
            }
            e.clearEvents();
            e.$elem.attr("style", e.$elem.data("owl-originalStyles") || "").attr("class", e.$elem.data("owl-originalClasses"))
        }, destroy: function () {
            var e = this;
            e.stop();
            t.clearInterval(e.checkVisible);
            e.unWrap();
            e.$elem.removeData()
        }, reinit: function (t) {
            var n = this, r = e.extend({}, n.userOptions, t);
            n.unWrap();
            n.init(r, n.$elem)
        }, addItem: function (e, t) {
            var n = this, r;
            if (!e) {
                return false
            }
            if (n.$elem.children().length === 0) {
                n.$elem.append(e);
                n.setVars();
                return false
            }
            n.unWrap();
            if (t === undefined || t === -1) {
                r = -1
            } else {
                r = t
            }
            if (r >= n.$userItems.length || r === -1) {
                n.$userItems.eq(-1).after(e)
            } else {
                n.$userItems.eq(r).before(e)
            }
            n.setVars()
        }, removeItem: function (e) {
            var t = this, n;
            if (t.$elem.children().length === 0) {
                return false
            }
            if (e === undefined || e === -1) {
                n = -1
            } else {
                n = e
            }
            t.unWrap();
            t.$userItems.eq(n).remove();
            t.setVars()
        }
    };
    e.fn.owlCarousel = function (t) {
        return this.each(function () {
            if (e(this).data("owl-init") === true) {
                return false
            }
            e(this).data("owl-init", true);
            var n = Object.create(r);
            n.init(t, this);
            e.data(this, "owlCarousel", n)
        })
    };
    e.fn.owlCarousel.options = {
        items: 5,
        itemsCustom: false,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 2],
        itemsTabletSmall: false,
        itemsMobile: [479, 1],
        singleItem: false,
        itemsScaleUp: false,
        slideSpeed: 200,
        paginationSpeed: 800,
        rewindSpeed: 1e3,
        autoPlay: false,
        stopOnHover: false,
        navigation: false,
        navigationText: ['<i class="icon angle left"></i>', '<i class="icon angle right"></i>'],
        rewindNav: true,
        scrollPerPage: false,
        pagination: true,
        paginationNumbers: false,
        responsive: true,
        responsiveRefreshRate: 200,
        responsiveBaseWidth: t,
        baseClass: "owl-carousel",
        theme: "owl-theme",
        lazyLoad: false,
        lazyFollow: true,
        lazyEffect: "fade",
        autoHeight: true,
        jsonPath: false,
        jsonSuccess: false,
        dragBeforeAnimFinish: true,
        mouseDrag: true,
        touchDrag: true,
        addClassActive: false,
        transitionStyle: false,
        beforeUpdate: false,
        afterUpdate: false,
        beforeInit: false,
        afterInit: false,
        beforeMove: false,
        afterMove: false,
        afterAction: false,
        startDragging: false,
        afterLazyLoad: false
    }
})(jQuery, window, document);
/*Ion.RangeSlider
 // version 1.8.5 Build: 159
 // 2013 Denis Ineshin | IonDen.com
 // Project page:    http://ionden.com/a/plugins/ion.rangeSlider/
 // GitHub page:     https://github.com/IonDen/ion.rangeSlider
 */
(function (g, a, f, c) {
    var e = 0;
    var h = (function () {
        var k = c.userAgent, j = /msie\s\d+/i, i;
        if (k.search(j) > 0) {
            i = j.exec(k).toString();
            i = i.split(" ")[1];
            if (i < 9) {
                return true
            }
        }
        return false
    }());
    var b = (function () {
        try {
            a.createEvent("TouchEvent");
            return true
        } catch (i) {
            return false
        }
    }());
    var d = {
        init: function (m) {
            var l = '<span class="irs"><span class="irs-line"></span><span class="irs-min">0</span><span class="irs-max">1</span><span class="irs-from">0</span><span class="irs-to">0</span><span class="irs-single">0</span></span><span class="irs-grid"></span>';
            var k = '<span class="irs-slider single"></span>';
            var j = '<span class="irs-diapason"></span><span class="irs-slider from"></span><span class="irs-slider to"></span>';
            var i = '<span class="irs-disable-mask"></span>';
            return this.each(function () {
                var ac = g.extend({
                    min: null,
                    max: null,
                    from: null,
                    to: null,
                    type: "single",
                    step: 1,
                    prefix: "",
                    postfix: "",
                    hasGrid: false,
                    hideMinMax: false,
                    hideFromTo: false,
                    prettify: true,
                    disable: false,
                    onChange: null,
                    onLoad: null,
                    onFinish: null
                }, m);
                var v = g(this), x = this, z = null;
                if (v.data("isActive")) {
                    return
                }
                v.data("isActive", true);
                e += 1;
                this.pluginCount = e;
                if (v.prop("value")) {
                    z = v.prop("value").split(";")
                }
                if (ac.type === "single") {
                    if (z && z.length > 1) {
                        if (typeof ac.min !== "number") {
                            ac.min = parseFloat(z[0])
                        } else {
                            if (typeof ac.from !== "number") {
                                ac.from = parseFloat(z[0])
                            }
                        }
                        if (typeof ac.max !== "number") {
                            ac.max = parseFloat(z[1])
                        }
                    } else {
                        if (z && z.length === 1) {
                            if (typeof ac.from !== "number") {
                                ac.from = parseFloat(z[0])
                            }
                        }
                    }
                } else {
                    if (ac.type === "double") {
                        if (z && z.length > 1) {
                            if (typeof ac.min !== "number") {
                                ac.min = parseFloat(z[0])
                            } else {
                                if (typeof ac.from !== "number") {
                                    ac.from = parseFloat(z[0])
                                }
                            }
                            if (typeof ac.max !== "number") {
                                ac.max = parseFloat(z[1])
                            } else {
                                if (typeof ac.to !== "number") {
                                    ac.to = parseFloat(z[1])
                                }
                            }
                        } else {
                            if (z && z.length === 1) {
                                if (typeof ac.min !== "number") {
                                    ac.min = parseFloat(z[0])
                                } else {
                                    if (typeof ac.from !== "number") {
                                        ac.from = parseFloat(z[0])
                                    }
                                }
                            }
                        }
                    }
                }
                if (typeof ac.min !== "number") {
                    ac.min = 10
                }
                if (typeof ac.max !== "number") {
                    ac.max = 100
                }
                if (typeof ac.from !== "number") {
                    ac.from = ac.min
                }
                if (typeof ac.to !== "number") {
                    ac.to = ac.max
                }
                if (typeof v.data("min") === "number") {
                    ac.min = parseFloat(v.data("min"))
                }
                if (typeof v.data("max") === "number") {
                    ac.max = parseFloat(v.data("max"))
                }
                if (typeof v.data("from") === "number") {
                    ac.from = parseFloat(v.data("from"))
                }
                if (typeof v.data("to") === "number") {
                    ac.to = parseFloat(v.data("to"))
                }
                if (v.data("step")) {
                    ac.step = parseFloat(v.data("step"))
                }
                if (v.data("type")) {
                    ac.type = v.data("type")
                }
                if (v.data("prefix")) {
                    ac.prefix = v.data("prefix")
                }
                if (v.data("postfix")) {
                    ac.postfix = v.data("postfix")
                }
                if (v.data("hasgrid")) {
                    ac.hasGrid = v.data("hasgrid")
                }
                if (v.data("hideminmax")) {
                    ac.hideMinMax = v.data("hideminmax")
                }
                if (v.data("hidefromto")) {
                    ac.hideFromTo = v.data("hidefromto")
                }
                if (v.data("prettify")) {
                    ac.prettify = v.data("prettify")
                }
                if (ac.from < ac.min) {
                    ac.from = ac.min
                }
                if (ac.to > ac.max) {
                    ac.to = ac.max
                }
                if (ac.type === "double") {
                    if (ac.from > ac.to) {
                        ac.from = ac.to
                    }
                    if (ac.to < ac.from) {
                        ac.to = ac.from
                    }
                }
                var C = function (aj) {
                    var ak = aj.toString();
                    if (ac.prettify) {
                        ak = ak.replace(/(\d{1,3}(?=(?:\d\d\d)+(?!\d)))/g, "$1 ")
                    }
                    return ak
                };
                var ah = '<span class="irs" id="irs-' + this.pluginCount + '"></span>';
                v[0].style.display = "none";
                v.before(ah);
                var u = v.prev(), J = g(a.body), aa = g(f), s, ab, F, af, V, H, r, q, B, M, ag, ad;
                var U = false, R = false, y = true, ai = {};
                var P = 0, o = 0, w = 0, ae = 0, G = 0, p = 0, n = 0, t = 0, W = 0, N = 0, I = 0;
                if (parseInt(ac.step, 10) !== parseFloat(ac.step)) {
                    I = ac.step.toString().split(".")[1];
                    I = Math.pow(10, I.length)
                }
                this.updateData = function (aj) {
                    y = true;
                    ac = g.extend(ac, aj);
                    L()
                };
                this.removeSlider = function () {
                    u.find("*").off();
                    aa.off("mouseup.irs" + x.pluginCount);
                    J.off("mouseup.irs" + x.pluginCount);
                    J.off("mousemove.irs" + x.pluginCount);
                    u.html("").remove();
                    v.data("isActive", false);
                    v.show()
                };
                var L = function () {
                    u.find("*").off();
                    aa.off("mouseup.irs" + x.pluginCount);
                    J.off("mouseup.irs" + x.pluginCount);
                    J.off("mousemove.irs" + x.pluginCount);
                    u.html("");
                    T()
                };
                var T = function () {
                    u.html(l);
                    s = u.find(".irs");
                    ab = s.find(".irs-min");
                    F = s.find(".irs-max");
                    af = s.find(".irs-from");
                    V = s.find(".irs-to");
                    H = s.find(".irs-single");
                    ad = u.find(".irs-grid");
                    if (ac.hideMinMax) {
                        ab[0].style.display = "none";
                        F[0].style.display = "none";
                        o = 0;
                        w = 0
                    }
                    if (ac.hideFromTo) {
                        af[0].style.display = "none";
                        V[0].style.display = "none";
                        H[0].style.display = "none"
                    }
                    if (!ac.hideMinMax) {
                        ab.html(ac.prefix + C(ac.min) + ac.postfix);
                        F.html(ac.prefix + C(ac.max) + ac.postfix);
                        o = ab.outerWidth();
                        w = F.outerWidth()
                    }
                    if (ac.type === "single") {
                        s.append(k);
                        r = s.find(".single");
                        r.on("mousedown", function (ak) {
                            ak.preventDefault();
                            ak.stopPropagation();
                            Q(ak, g(this), null);
                            U = true;
                            R = true;
                            if (h) {
                                g("*").prop("unselectable", true)
                            }
                        });
                        if (b) {
                            r.on("touchstart", function (ak) {
                                ak.preventDefault();
                                ak.stopPropagation();
                                Q(ak.originalEvent.touches[0], g(this), null);
                                U = true;
                                R = true
                            })
                        }
                    } else {
                        if (ac.type === "double") {
                            s.append(j);
                            q = s.find(".from");
                            B = s.find(".to");
                            ag = s.find(".irs-diapason");
                            S();
                            q.on("mousedown", function (ak) {
                                ak.preventDefault();
                                ak.stopPropagation();
                                g(this).addClass("last");
                                B.removeClass("last");
                                Q(ak, g(this), "from");
                                U = true;
                                R = true;
                                if (h) {
                                    g("*").prop("unselectable", true)
                                }
                            });
                            B.on("mousedown", function (ak) {
                                ak.preventDefault();
                                ak.stopPropagation();
                                g(this).addClass("last");
                                q.removeClass("last");
                                Q(ak, g(this), "to");
                                U = true;
                                R = true;
                                if (h) {
                                    g("*").prop("unselectable", true)
                                }
                            });
                            if (b) {
                                q.on("touchstart", function (ak) {
                                    ak.preventDefault();
                                    ak.stopPropagation();
                                    g(this).addClass("last");
                                    B.removeClass("last");
                                    Q(ak.originalEvent.touches[0], g(this), "from");
                                    U = true;
                                    R = true
                                });
                                B.on("touchstart", function (ak) {
                                    ak.preventDefault();
                                    ak.stopPropagation();
                                    g(this).addClass("last");
                                    q.removeClass("last");
                                    Q(ak.originalEvent.touches[0], g(this), "to");
                                    U = true;
                                    R = true
                                })
                            }
                            if (ac.to === ac.max) {
                                q.addClass("last")
                            }
                        }
                    }
                    var aj = function () {
                        if (U) {
                            R = false;
                            U = false;
                            M.removeAttr("id");
                            M = null;
                            if (ac.type === "double") {
                                S()
                            }
                            D();
                            if (h) {
                                g("*").prop("unselectable", false)
                            }
                        }
                    };
                    J.on("mouseup.irs" + x.pluginCount, function () {
                        aj()
                    });
                    aa.on("mouseup.irs" + x.pluginCount, function () {
                        aj()
                    });
                    J.on("mousemove.irs" + x.pluginCount, function (ak) {
                        if (U) {
                            P = ak.pageX;
                            X()
                        }
                    });
                    u.on("mouseup", function (ak) {
                        if (U || ac.disable) {
                            return
                        }
                        Y(ak.pageX)
                    });
                    if (b) {
                        aa.on("touchend", function () {
                            if (U) {
                                R = false;
                                U = false;
                                M.removeAttr("id");
                                M = null;
                                if (ac.type === "double") {
                                    S()
                                }
                                D()
                            }
                        });
                        aa.on("touchmove", function (ak) {
                            if (U) {
                                P = ak.originalEvent.touches[0].pageX;
                                X()
                            }
                        })
                    }
                    K();
                    Z();
                    if (ac.hasGrid) {
                        A()
                    }
                    if (ac.disable) {
                        E()
                    }
                };
                var K = function () {
                    ae = s.width();
                    if (r) {
                        p = r.width()
                    } else {
                        p = q.width()
                    }
                    G = ae - p
                };
                var Q = function (an, ak, aj) {
                    K();
                    y = false;
                    M = ak;
                    M.attr("id", "irs-active-slider");
                    var am = M.offset().left, al = an.pageX - am;
                    N = am + al - M.position().left;
                    if (ac.type === "single") {
                        n = s.width() - p
                    } else {
                        if (ac.type === "double") {
                            if (aj === "from") {
                                t = 0;
                                W = parseInt(B.css("left"), 10)
                            } else {
                                t = parseInt(q.css("left"), 10);
                                W = s.width() - p
                            }
                        }
                    }
                };
                var S = function () {
                    var an = q.width(), am = g.data(q[0], "x") || parseInt(q[0].style.left, 10) || q.position().left, ak = g.data(B[0], "x") || parseInt(B[0].style.left, 10) || B.position().left, aj = am + (an / 2), al = ak - am;
                    ag[0].style.left = aj + "px";
                    ag[0].style.width = al + "px"
                };
                var X = function (al) {
                    var ak = P - N, aj;
                    if (al) {
                        ak = al
                    } else {
                        ak = P - N
                    }
                    if (ac.type === "single") {
                        if (ak < 0) {
                            ak = 0
                        }
                        if (ak > n) {
                            ak = n
                        }
                    } else {
                        if (ac.type === "double") {
                            if (ak < t) {
                                ak = t
                            }
                            if (ak > W) {
                                ak = W
                            }
                            S()
                        }
                    }
                    g.data(M[0], "x", ak);
                    D();
                    aj = Math.round(ak);
                    M[0].style.left = aj + "px"
                };
                var D = function () {
                    var am = {
                        input: v,
                        slider: u,
                        fromNumber: 0,
                        toNumber: 0,
                        fromPers: 0,
                        toPers: 0,
                        fromX: 0,
                        toX: 0
                    };
                    var al = ac.max - ac.min, ak, aj;
                    if (ac.type === "single") {
                        am.fromX = g.data(r[0], "x") || parseInt(r[0].style.left, 10) || r.position().left;
                        am.fromPers = am.fromX / G * 100;
                        ak = (al / 100 * am.fromPers) + ac.min;
                        am.fromNumber = Math.round(ak / ac.step) * ac.step;
                        if (am.fromNumber < ac.min) {
                            am.fromNumber = ac.min
                        }
                        if (am.fromNumber > ac.max) {
                            am.fromNumber = ac.max
                        }
                        if (I) {
                            am.fromNumber = parseInt(am.fromNumber * I, 10) / I
                        }
                    } else {
                        if (ac.type === "double") {
                            am.fromX = g.data(q[0], "x") || parseInt(q[0].style.left, 10) || q.position().left;
                            am.fromPers = am.fromX / G * 100;
                            ak = (al / 100 * am.fromPers) + ac.min;
                            am.fromNumber = Math.round(ak / ac.step) * ac.step;
                            if (am.fromNumber < ac.min) {
                                am.fromNumber = ac.min
                            }
                            am.toX = g.data(B[0], "x") || parseInt(B[0].style.left, 10) || B.position().left;
                            am.toPers = am.toX / G * 100;
                            aj = (al / 100 * am.toPers) + ac.min;
                            am.toNumber = Math.round(aj / ac.step) * ac.step;
                            if (am.toNumber > ac.max) {
                                am.toNumber = ac.max
                            }
                            if (I) {
                                am.fromNumber = parseInt(am.fromNumber * I, 10) / I;
                                am.toNumber = parseInt(am.toNumber * I, 10) / I
                            }
                        }
                    }
                    ai = am;
                    O()
                };
                var Z = function () {
                    var ak = {
                        input: v,
                        slider: u,
                        fromNumber: ac.from,
                        toNumber: ac.to,
                        fromPers: 0,
                        toPers: 0,
                        fromX: 0,
                        fromX_pure: 0,
                        toX: 0,
                        toX_pure: 0
                    };
                    var aj = ac.max - ac.min;
                    if (ac.type === "single") {
                        ak.fromPers = (ak.fromNumber - ac.min) / aj * 100;
                        ak.fromX_pure = G / 100 * ak.fromPers;
                        ak.fromX = Math.round(ak.fromX_pure);
                        r[0].style.left = ak.fromX + "px";
                        g.data(r[0], "x", ak.fromX_pure)
                    } else {
                        if (ac.type === "double") {
                            ak.fromPers = (ak.fromNumber - ac.min) / aj * 100;
                            ak.fromX_pure = G / 100 * ak.fromPers;
                            ak.fromX = Math.round(ak.fromX_pure);
                            q[0].style.left = ak.fromX + "px";
                            g.data(q[0], "x", ak.fromX_pure);
                            ak.toPers = (ak.toNumber - ac.min) / aj * 100;
                            ak.toX_pure = G / 100 * ak.toPers;
                            ak.toX = Math.round(ak.toX_pure);
                            B[0].style.left = ak.toX + "px";
                            g.data(B[0], "x", ak.toX_pure);
                            S()
                        }
                    }
                    ai = ak;
                    O()
                };
                var Y = function (ak) {
                    var aj = ak - u.offset().left, al = ai.toX - ai.fromX, am = ai.fromX + (al / 2);
                    t = 0;
                    n = s.width() - p;
                    W = s.width() - p;
                    if (ac.type === "single") {
                        M = r;
                        M.attr("id", "irs-active-slider");
                        X(aj)
                    } else {
                        if (ac.type === "double") {
                            if (aj <= am) {
                                M = q
                            } else {
                                M = B
                            }
                            M.attr("id", "irs-active-slider");
                            X(aj);
                            S()
                        }
                    }
                    M.removeAttr("id");
                    M = null
                };
                var O = function () {
                    var am, ar, aq, al, aj, at, ak, ao, an, ap = (p / 2);
                    if (ac.type === "single") {
                        if (!ac.hideText) {
                            af[0].style.display = "none";
                            V[0].style.display = "none";
                            ak = ac.prefix + C(ai.fromNumber) + ac.postfix;
                            H.html(ak);
                            ao = H.outerWidth();
                            an = ai.fromX - (ao / 2) + ap;
                            if (an < 0) {
                                an = 0
                            }
                            if (an > ae - ao) {
                                an = ae - ao
                            }
                            H[0].style.left = an + "px";
                            if (!ac.hideMinMax && !ac.hideFromTo) {
                                if (an < o) {
                                    ab[0].style.display = "none"
                                } else {
                                    ab[0].style.display = "block"
                                }
                                if (an + ao > ae - w) {
                                    F[0].style.display = "none"
                                } else {
                                    F[0].style.display = "block"
                                }
                            }
                        }
                        v.attr("value", parseFloat(ai.fromNumber))
                    } else {
                        if (ac.type === "double") {
                            if (!ac.hideText) {
                                am = ac.prefix + C(ai.fromNumber) + ac.postfix;
                                al = ac.prefix + C(ai.toNumber) + ac.postfix;
                                if (ai.fromNumber !== ai.toNumber) {
                                    ak = ac.prefix + C(ai.fromNumber) + " — " + ac.prefix + C(ai.toNumber) + ac.postfix
                                } else {
                                    ak = ac.prefix + C(ai.fromNumber) + ac.postfix
                                }
                                af.html(am);
                                V.html(al);
                                H.html(ak);
                                ar = af.outerWidth();
                                aq = ai.fromX - (ar / 2) + ap;
                                if (aq < 0) {
                                    aq = 0
                                }
                                if (aq > ae - ar) {
                                    aq = ae - ar
                                }
                                af[0].style.left = aq + "px";
                                aj = V.outerWidth();
                                at = ai.toX - (aj / 2) + ap;
                                if (at < 0) {
                                    at = 0
                                }
                                if (at > ae - aj) {
                                    at = ae - aj
                                }
                                V[0].style.left = at + "px";
                                ao = H.outerWidth();
                                an = ai.fromX + ((ai.toX - ai.fromX) / 2) - (ao / 2) + ap;
                                if (an < 0) {
                                    an = 0
                                }
                                if (an > ae - ao) {
                                    an = ae - ao
                                }
                                H[0].style.left = an + "px";
                                if (aq + ar < at) {
                                    H[0].style.display = "none";
                                    af[0].style.display = "block";
                                    V[0].style.display = "block"
                                } else {
                                    H[0].style.display = "block";
                                    af[0].style.display = "none";
                                    V[0].style.display = "none"
                                }
                                if (!ac.hideMinMax && !ac.hideFromTo) {
                                    if (an < o || aq < o) {
                                        ab[0].style.display = "none"
                                    } else {
                                        ab[0].style.display = "block"
                                    }
                                    if (an + ao > ae - w || at + aj > ae - w) {
                                        F[0].style.display = "none"
                                    } else {
                                        F[0].style.display = "block"
                                    }
                                }
                            }
                            v.attr("value", parseFloat(ai.fromNumber) + ";" + parseFloat(ai.toNumber))
                        }
                    }
                    if (typeof ac.onChange === "function") {
                        ac.onChange.call(this, ai)
                    }
                    if (typeof ac.onFinish === "function" && !R && !y) {
                        ac.onFinish.call(this, ai)
                    }
                    if (typeof ac.onLoad === "function" && !R && y) {
                        ac.onLoad.call(this, ai)
                    }
                };
                var A = function () {
                    u.addClass("irs-with-grid");
                    var ak, ao = "", am = 0, al = 0, an = "", ap = 20, aj = 4;
                    for (ak = 0; ak <= ap; ak += 1) {
                        am = Math.floor(ae / ap * ak);
                        if (am >= ae) {
                            am = ae - 1
                        }
                        an += '<span class="irs-grid-pol small" style="left: ' + am + 'px;"></span>'
                    }
                    for (ak = 0; ak <= aj; ak += 1) {
                        am = Math.floor(ae / aj * ak);
                        if (am >= ae) {
                            am = ae - 1
                        }
                        an += '<span class="irs-grid-pol" style="left: ' + am + 'px;"></span>';
                        if (I) {
                            ao = (ac.min + ((ac.max - ac.min) / aj * ak));
                            ao = (ao / ac.step) * ac.step;
                            ao = parseInt(ao * I, 10) / I
                        } else {
                            ao = Math.round(ac.min + ((ac.max - ac.min) / aj * ak));
                            ao = Math.round(ao / ac.step) * ac.step;
                            ao = C(ao)
                        }
                        if (ak === 0) {
                            al = am;
                            an += '<span class="irs-grid-text" style="left: ' + al + 'px; text-align: left;">' + ao + "</span>"
                        } else {
                            if (ak === aj) {
                                al = am - 100;
                                an += '<span class="irs-grid-text" style="left: ' + al + 'px; text-align: right;">' + ao + "</span>"
                            } else {
                                al = am - 50;
                                an += '<span class="irs-grid-text" style="left: ' + al + 'px;">' + ao + "</span>"
                            }
                        }
                    }
                    ad.html(an)
                };
                var E = function () {
                    u.addClass("irs-disabled");
                    u.append(i)
                };
                T()
            })
        }, update: function (i) {
            return this.each(function () {
                this.updateData(i)
            })
        }, remove: function () {
            return this.each(function () {
                this.removeSlider()
            })
        }
    };
    g.fn.ionRangeSlider = function (i) {
        if (d[i]) {
            return d[i].apply(this, Array.prototype.slice.call(arguments, 1))
        } else {
            if (typeof i === "object" || !i) {
                return d.init.apply(this, arguments)
            } else {
                g.error("Method " + i + " does not exist for jQuery.ionRangeSlider")
            }
        }
    }
}(jQuery, document, window, navigator));
/*! enscroll - v0.6.0 - 2014-02-27
 * http://enscrollplugin.com
 * Copyright (c) 2014 ; Licensed  */
!function (a) {
    function b(b, e) {
        var f, g, h, i = this, j = b.add(i), k = a(window), l = a.tools.expose && (e.mask || e.expose), m = Math.random().toString().slice(10);
        l && ("string" == typeof l && (l = {color: l}), l.closeOnClick = l.closeOnEsc = !1);
        var n = e.target || b.attr("rel");
        if (g = n ? a(n) : null || b, !g.length)throw"Could not find Overlay: " + n;
        b && -1 == b.index(g) && b.click(function (a) {
            return i.load(a), a.preventDefault()
        }), a.extend(i, {
            load: function (b) {
                if (i.isOpened())return i;
                var f = d[e.effect];
                if (!f)throw'Overlay: cannot find effect : "' + e.effect + '"';
                if (e.oneInstance && a.each(c, function () {
                        this.close(b)
                    }), b = b || a.Event(), b.type = "onBeforeLoad", j.trigger(b), b.isDefaultPrevented())return i;
                h = !0, l && a(g).expose(l);
                var n = e.top, o = e.left, p = g.outerWidth(!0), q = g.outerHeight(!0);
                return "string" == typeof n && (n = "center" == n ? Math.max((k.height() - q) / 2, 0) : parseInt(n, 10) / 100 * k.height()), "center" == o && (o = Math.max((k.width() - p) / 2, 0)), f[0].call(i, {
                    top: n,
                    left: o
                }, function () {
                    h && (b.type = "onLoad", j.trigger(b))
                }), l && e.closeOnClick && a.mask.getMask().one("click", i.close), e.closeOnClick && a(document).on("click." + m, function (b) {
                    a(b.target).parents(g).length || i.close(b)
                }), e.closeOnEsc && a(document).on("keydown." + m, function (a) {
                    27 == a.keyCode && i.close(a)
                }), i
            }, close: function (b) {
                return i.isOpened() ? (b = b || a.Event(), b.type = "onBeforeClose", j.trigger(b), b.isDefaultPrevented() ? void 0 : (h = !1, d[e.effect][1].call(i, function () {
                    b.type = "onClose", j.trigger(b)
                }), a(document).off("click." + m + " keydown." + m), l && a.mask.close(), i)) : i
            }, getOverlay: function () {
                return g
            }, getTrigger: function () {
                return b
            }, getClosers: function () {
                return f
            }, isOpened: function () {
                return h
            }, getConf: function () {
                return e
            }
        }), a.each("onBeforeLoad,onStart,onLoad,onBeforeClose,onClose".split(","), function (b, c) {
            a.isFunction(e[c]) && a(i).on(c, e[c]), i[c] = function (b) {
                return b && a(i).on(c, b), i
            }
        }), f = g.find(e.close || ".close"), !f.length && !e.close && (f = a('<a class="close"></a>'), g.prepend(f)), f.click(function (a) {
            i.close(a)
        }), e.load && i.load()
    }

    a.tools = a.tools || {version: "v1.2.7"}, a.tools.overlay = {
        addEffect: function (a, b, c) {
            d[a] = [b, c]
        },
        conf: {
            close: null,
            closeOnClick: !0,
            closeOnEsc: !0,
            closeSpeed: "fast",
            effect: "default",
            fixed: !0,
            left: "center",
            load: !1,
            mask: null,
            oneInstance: !0,
            speed: "normal",
            target: null,
            top: "10%"
        }
    };
    var c = [], d = {};
    a.tools.overlay.addEffect("default", function (b, c) {
        var d = this.getConf(), e = a(window);
        d.fixed || (b.top += e.scrollTop(), b.left += e.scrollLeft()), b.position = d.fixed ? "fixed" : "absolute", this.getOverlay().css(b).fadeIn(d.speed, c)
    }, function (a) {
        this.getOverlay().fadeOut(this.getConf().closeSpeed, a)
    }), a.fn.overlay = function (d) {
        var e = this.data("overlay");
        return e ? e : (a.isFunction(d) && (d = {onBeforeLoad: d}), d = a.extend(!0, {}, a.tools.overlay.conf, d), this.each(function () {
            e = new b(a(this), d), c.push(e), a(this).data("overlay", e)
        }), d.api ? e : this)
    }
}(jQuery), function (a) {
    function b(a) {
        var b = a.offset();
        return {top: b.top + a.height() / 2, left: b.left + a.width() / 2}
    }

    var c = a.tools.overlay, d = a(window);
    a.extend(c.conf, {start: {top: null, left: null}, fadeInSpeed: "fast", zIndex: 9999});
    var e = function (c, e) {
        var f = this.getOverlay(), g = this.getConf(), h = this.getTrigger(), i = this, j = f.outerWidth(!0), k = f.data("img"), l = g.fixed ? "fixed" : "absolute";
        if (!k) {
            var m = f.css("backgroundImage");
            if (!m)throw"background-image CSS property not set for overlay";
            m = m.slice(m.indexOf("(") + 1, m.indexOf(")")).replace(/\"/g, ""), f.css("backgroundImage", "none"), k = a('<img src="' + m + '"/>'), k.css({
                border: 0,
                display: "none"
            }).width(j), a("body").append(k), f.data("img", k)
        }
        var n = g.start.top || Math.round(d.height() / 2), o = g.start.left || Math.round(d.width() / 2);
        if (h) {
            var p = b(h);
            n = p.top, o = p.left
        }
        g.fixed ? (n -= d.scrollTop(), o -= d.scrollLeft()) : (c.top += d.scrollTop(), c.left += d.scrollLeft()), k.css({
            position: "absolute",
            top: n,
            left: o,
            width: 0,
            zIndex: g.zIndex
        }).show(), c.position = l, f.css(c), k.animate({top: c.top, left: c.left, width: j}, g.speed, function () {
            f.css("zIndex", g.zIndex + 1).fadeIn(g.fadeInSpeed, function () {
                i.isOpened() && !a(this).index(f) ? e.call() : f.hide()
            })
        }).css("position", l)
    }, f = function (c) {
        var e = this.getOverlay().hide(), f = this.getConf(), g = this.getTrigger(), h = e.data("img"), i = {
            top: f.start.top,
            left: f.start.left,
            width: 0
        };
        g && a.extend(i, b(g)), f.fixed && h.css({position: "absolute"}).animate({
            top: "+=" + d.scrollTop(),
            left: "+=" + d.scrollLeft()
        }, 0), h.animate(i, f.closeSpeed, c)
    };
    c.addEffect("apple", e, f)
}(jQuery), function (a) {
    function b() {
        if (a.browser.msie) {
            var b = a(document).height(), c = a(window).height();
            return [window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth, 20 > b - c ? c : b]
        }
        return [a(document).width(), a(document).height()]
    }

    function c(b) {
        return b ? b.call(a.mask) : void 0
    }

    a.tools = a.tools || {version: "v1.2.7"};
    var d;
    d = a.tools.expose = {
        conf: {
            maskId: "exposeMask",
            loadSpeed: "slow",
            closeSpeed: "fast",
            closeOnClick: !0,
            closeOnEsc: !0,
            zIndex: 9998,
            opacity: .8,
            startOpacity: 0,
            color: "#fff",
            onLoad: null,
            onClose: null
        }
    };
    var e, f, g, h, i;
    a.mask = {
        load: function (j, k) {
            if (g)return this;
            "string" == typeof j && (j = {color: j}), j = j || h, h = j = a.extend(a.extend({}, d.conf), j), e = a("#" + j.maskId), e.length || (e = a("<div/>").attr("id", j.maskId), a("body").append(e));
            var l = b();
            return e.css({
                position: "absolute",
                top: 0,
                left: 0,
                width: l[0],
                height: l[1],
                display: "none",
                opacity: j.startOpacity,
                zIndex: j.zIndex
            }), j.color && e.css("backgroundColor", j.color), c(j.onBeforeLoad) === !1 ? this : (j.closeOnEsc && a(document).on("keydown.mask", function (b) {
                27 == b.keyCode && a.mask.close(b)
            }), j.closeOnClick && e.on("click.mask", function (b) {
                a.mask.close(b)
            }), a(window).on("resize.mask", function () {
                a.mask.fit()
            }), k && k.length && (i = k.eq(0).css("zIndex"), a.each(k, function () {
                var b = a(this);
                /relative|absolute|fixed/i.test(b.css("position")) || b.css("position", "relative")
            }), f = k.css({zIndex: Math.max(j.zIndex + 1, "auto" == i ? 0 : i)})), e.css({display: "block"}).fadeTo(j.loadSpeed, j.opacity, function () {
                a.mask.fit(), c(j.onLoad), g = "full"
            }), g = !0, this)
        }, close: function () {
            if (g) {
                if (c(h.onBeforeClose) === !1)return this;
                e.fadeOut(h.closeSpeed, function () {
                    c(h.onClose), f && f.css({zIndex: i}), g = !1
                }), a(document).off("keydown.mask"), e.off("click.mask"), a(window).off("resize.mask")
            }
            return this
        }, fit: function () {
            if (g) {
                var a = b();
                e.css({width: a[0], height: a[1]})
            }
        }, getMask: function () {
            return e
        }, isLoaded: function (a) {
            return a ? "full" == g : g
        }, getConf: function () {
            return h
        }, getExposed: function () {
            return f
        }
    }, a.fn.mask = function (b) {
        return a.mask.load(b), this
    }, a.fn.expose = function (b) {
        return a.mask.load(b, this), this
    }
}(jQuery), $(document).ready(function () {
    function a(a) {
        top.consoleRef = window.open("", "myconsole", "width=600,height=300,left=50,top=50,menubar=0,toolbar=0,location=0,status=0,scrollbars=1,resizable=1"), top.consoleRef.document.writeln("<html><head><title>Snippet :: Code View :: " + location.href + '</title></head><body bgcolor=white onLoad="self.focus()"><pre>' + a + "</pre></body></html>"), top.consoleRef.document.close()
    }

    $(".snippet-container").each(function () {
        $(this).find("a.snippet-text").click(function () {
            var a = $(this).parents(".snippet-wrap").find(".snippet-formatted"), b = $(this).parents(".snippet-wrap").find(".snippet-textonly");
            return a.toggle(), b.toggle(), b.is(":visible") ? $(this).html("html") : $(this).html("text"), !1
        }), $(this).find("a.snippet-window").click(function () {
            var b = $(this).parents(".snippet-wrap").find(".snippet-textonly").html();
            return a(b), $(this).blur(), !1
        }), $(this).hover(function () {
            $(this).find(".snippet-menu").fadeIn("fast")
        }, function () {
            $(this).find(".snippet-menu").fadeOut("fast")
        })
    }), $(".snippet-expand, .snippet-close").each(function () {
        $(this).click(function () {
            $(this).parents(".snippet-container").find(".snippet-wrap").toggle()
        })
    })
});
var Handlebars = {};
!function (a, b) {
    a.VERSION = "1.0.0", a.COMPILER_REVISION = 4, a.REVISION_CHANGES = {
        1: "<= 1.0.rc.2",
        2: "== 1.0.0-rc.3",
        3: "== 1.0.0-rc.4",
        4: ">= 1.0.0"
    }, a.helpers = {}, a.partials = {};
    var c = Object.prototype.toString, d = "[object Function]", e = "[object Object]";
    a.registerHelper = function (b, d, f) {
        if (c.call(b) === e) {
            if (f || d)throw new a.Exception("Arg not supported with multiple helpers");
            a.Utils.extend(this.helpers, b)
        } else f && (d.not = f), this.helpers[b] = d
    }, a.registerPartial = function (b, d) {
        c.call(b) === e ? a.Utils.extend(this.partials, b) : this.partials[b] = d
    }, a.registerHelper("helperMissing", function (a) {
        if (2 === arguments.length)return b;
        throw new Error("Missing helper: '" + a + "'")
    }), a.registerHelper("blockHelperMissing", function (b, e) {
        var f = e.inverse || function () {
            }, g = e.fn, h = c.call(b);
        return h === d && (b = b.call(this)), b === !0 ? g(this) : b === !1 || null == b ? f(this) : "[object Array]" === h ? b.length > 0 ? a.helpers.each(b, e) : f(this) : g(b)
    }), a.K = function () {
    }, a.createFrame = Object.create || function (b) {
            a.K.prototype = b;
            var c = new a.K;
            return a.K.prototype = null, c
        }, a.logger = {
        DEBUG: 0,
        INFO: 1,
        WARN: 2,
        ERROR: 3,
        level: 3,
        methodMap: {0: "debug", 1: "info", 2: "warn", 3: "error"},
        log: function (b, c) {
            if (a.logger.level <= b) {
                var d = a.logger.methodMap[b];
                "undefined" != typeof console && console[d] && console[d].call(console, c)
            }
        }
    }, a.log = function (b, c) {
        a.logger.log(b, c)
    }, a.registerHelper("each", function (b, e) {
        var f, g = e.fn, h = e.inverse, i = 0, j = "", k = c.call(b);
        if (k === d && (b = b.call(this)), e.data && (f = a.createFrame(e.data)), b && "object" == typeof b)if (b instanceof Array)for (var l = b.length; l > i; i++)f && (f.index = i), j += g(b[i], {data: f}); else for (var m in b)b.hasOwnProperty(m) && (f && (f.key = m), j += g(b[m], {data: f}), i++);
        return 0 === i && (j = h(this)), j
    }), a.registerHelper("if", function (b, e) {
        var f = c.call(b);
        return f === d && (b = b.call(this)), !b || a.Utils.isEmpty(b) ? e.inverse(this) : e.fn(this)
    }), a.registerHelper("unless", function (b, c) {
        return a.helpers["if"].call(this, b, {fn: c.inverse, inverse: c.fn})
    }), a.registerHelper("with", function (b, e) {
        var f = c.call(b);
        return f === d && (b = b.call(this)), a.Utils.isEmpty(b) ? void 0 : e.fn(b)
    }), a.registerHelper("log", function (b, c) {
        var d = c.data && null != c.data.level ? parseInt(c.data.level, 10) : 1;
        a.log(d, b)
    });
    var f = ["description", "fileName", "lineNumber", "message", "name", "number", "stack"];
    a.Exception = function () {
        for (var a = Error.prototype.constructor.apply(this, arguments), b = 0; b < f.length; b++)this[f[b]] = a[f[b]]
    }, a.Exception.prototype = new Error, a.SafeString = function (a) {
        this.string = a
    }, a.SafeString.prototype.toString = function () {
        return this.string.toString()
    };
    var g = {
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#x27;",
        "`": "&#x60;"
    }, h = /[&<>"'`]/g, i = /[&<>"'`]/, j = function (a) {
        return g[a] || "&amp;"
    };
    a.Utils = {
        extend: function (a, b) {
            for (var c in b)b.hasOwnProperty(c) && (a[c] = b[c])
        }, escapeExpression: function (b) {
            return b instanceof a.SafeString ? b.toString() : null == b || b === !1 ? "" : (b = b.toString(), i.test(b) ? b.replace(h, j) : b)
        }, isEmpty: function (a) {
            return a || 0 === a ? "[object Array]" === c.call(a) && 0 === a.length ? !0 : !1 : !0
        }
    }, a.VM = {
        template: function (b) {
            var c = {
                escapeExpression: a.Utils.escapeExpression,
                invokePartial: a.VM.invokePartial,
                programs: [],
                program: function (b, c, d) {
                    var e = this.programs[b];
                    return d ? e = a.VM.program(b, c, d) : e || (e = this.programs[b] = a.VM.program(b, c)), e
                },
                merge: function (b, c) {
                    var d = b || c;
                    return b && c && (d = {}, a.Utils.extend(d, c), a.Utils.extend(d, b)), d
                },
                programWithDepth: a.VM.programWithDepth,
                noop: a.VM.noop,
                compilerInfo: null
            };
            return function (d, e) {
                e = e || {};
                var f = b.call(c, a, d, e.helpers, e.partials, e.data), g = c.compilerInfo || [], h = g[0] || 1, i = a.COMPILER_REVISION;
                if (h !== i) {
                    if (i > h) {
                        var j = a.REVISION_CHANGES[i], k = a.REVISION_CHANGES[h];
                        throw"Template was precompiled with an older version of Handlebars than the current runtime. Please update your precompiler to a newer version (" + j + ") or downgrade your runtime to an older version (" + k + ")."
                    }
                    throw"Template was precompiled with a newer version of Handlebars than the current runtime. Please update your runtime to a newer version (" + g[1] + ")."
                }
                return f
            }
        }, programWithDepth: function (a, b, c) {
            var d = Array.prototype.slice.call(arguments, 3), e = function (a, e) {
                return e = e || {}, b.apply(this, [a, e.data || c].concat(d))
            };
            return e.program = a, e.depth = d.length, e
        }, program: function (a, b, c) {
            var d = function (a, d) {
                return d = d || {}, b(a, d.data || c)
            };
            return d.program = a, d.depth = 0, d
        }, noop: function () {
            return ""
        }, invokePartial: function (c, d, e, f, g, h) {
            var i = {helpers: f, partials: g, data: h};
            if (c === b)throw new a.Exception("The partial " + d + " could not be found");
            if (c instanceof Function)return c(e, i);
            if (a.compile)return g[d] = a.compile(c, {data: h !== b}), g[d](e, i);
            throw new a.Exception("The partial " + d + " could not be compiled when running in runtime-only mode")
        }
    }, a.template = a.VM.template
}(Handlebars), this.JST = this.JST || {}, this.JST["templates/doc-list.handlebars"] = Handlebars.template(function (a, b, c, d, e) {
    function f(a, b) {
        var d, e = "";
        return e += '\n	<li>\n		<dt class="property">Property</dt>\n		<dd class="property">', (d = c.property) ? d = d.call(a, {
            hash: {},
            data: b
        }) : (d = a.property, d = typeof d === i ? d.apply(a) : d), e += j(d) + '</dd>\n		<dt class="value">Default Value</dt>\n		<dd class="value">', (d = c.value) ? d = d.call(a, {
            hash: {},
            data: b
        }) : (d = a.value, d = typeof d === i ? d.apply(a) : d), e += j(d) + '</dd>\n		<dt class="description">Description</dt>\n		<dd class="description">', (d = c.description) ? d = d.call(a, {
            hash: {},
            data: b
        }) : (d = a.description, d = typeof d === i ? d.apply(a) : d), e += j(d) + "</dd>\n	</li>\n"
    }

    this.compilerInfo = [4, ">= 1.0.0"], c = this.merge(c, a.helpers), e = e || {};
    var g, h = "", i = "function", j = this.escapeExpression, k = this;
    return h += "<ul>\n", g = c.each.call(b, b, {
        hash: {},
        inverse: k.noop,
        fn: k.program(1, f, e),
        data: e
    }), (g || 0 === g) && (h += g), h += "\n</ul>\n"
}), this.JST["templates/doc-table.handlebars"] = Handlebars.template(function (a, b, c, d, e) {
    function f(a, b) {
        var d, e = "";
        return e += '\n		<tr>\n			<td class="property">', (d = c.property) ? d = d.call(a, {
            hash: {},
            data: b
        }) : (d = a.property, d = typeof d === i ? d.apply(a) : d), e += j(d) + '</td>\n			<td class="value">', (d = c.value) ? d = d.call(a, {
            hash: {},
            data: b
        }) : (d = a.value, d = typeof d === i ? d.apply(a) : d), e += j(d) + '</td>\n			<td class="description">', (d = c.description) ? d = d.call(a, {
            hash: {},
            data: b
        }) : (d = a.description, d = typeof d === i ? d.apply(a) : d), e += j(d) + "</td>\n		</tr>\n"
    }

    this.compilerInfo = [4, ">= 1.0.0"], c = this.merge(c, a.helpers), e = e || {};
    var g, h = "", i = "function", j = this.escapeExpression, k = this;
    return h += '<table>\n	<thead>\n		<tr>\n			<th class="property">Property</th>\n			<th class="value">Default Value</th>\n			<th class="description">Description</th>\n		</tr>\n	</thead>\n	<tbody>\n', g = c.each.call(b, b, {
        hash: {},
        inverse: k.noop,
        fn: k.program(1, f, e),
        data: e
    }), (g || 0 === g) && (h += g), h += "\n	</tbody>\n</table>\n"
}), function (a, b, c, d) {
    var e = {
        verticalScrolling: !0,
        horizontalScrolling: !1,
        verticalScrollerSide: "right",
        showOnHover: !1,
        scrollIncrement: 20,
        minScrollbarLength: 40,
        pollChanges: !0,
        drawCorner: !0,
        drawScrollButtons: !1,
        clickTrackToScroll: !0,
        easingDuration: 500,
        propagateWheelEvent: !0,
        verticalTrackClass: "vertical-track",
        horizontalTrackClass: "horizontal-track",
        horizontalHandleClass: "horizontal-handle",
        verticalHandleClass: "vertical-handle",
        scrollUpButtonClass: "scroll-up-btn",
        scrollDownButtonClass: "scroll-down-btn",
        scrollLeftButtonClass: "scroll-left-btn",
        scrollRightButtonClass: "scroll-right-btn",
        cornerClass: "scrollbar-corner",
        zIndex: 1,
        addPaddingToPane: !0,
        horizontalHandleHTML: '<div class="left"></div><div class="right"></div>',
        verticalHandleHTML: '<div class="top"></div><div class="bottom"></div>'
    }, f = function (a) {
        a.preventDefault ? a.preventDefault() : a.returnValue = !1, a.stopPropagation ? a.stopPropagation() : a.cancelBubble = !0
    }, g = b.requestAnimationFrame || b.mozRequestAnimationFrame || b.webkitRequestAnimationFrame || b.oRequestAnimationFrame || b.msRequestAnimationFrame || function (a) {
            setTimeout(a, 17)
        }, h = function (b, c) {
        var d = a(b).css(c), e = /^-?\d+/.exec(d);
        return e ? +e[0] : 0
    }, i = function (a) {
        var b, c, d = {
            width: "5px",
            height: "1px",
            overflow: "hidden",
            padding: "8px 0",
            visibility: "hidden",
            whiteSpace: "pre-line",
            font: "10px/1 serif"
        }, e = document.createElement(a), f = document.createTextNode("a\na");
        for (c in d)e.style[c] = d[c];
        return e.appendChild(f), document.body.appendChild(e), b = e.scrollHeight < 28, document.body.removeChild(e), b
    }, j = .5 * Math.PI, k = 10 * Math.log(2), l = function (a, b, c) {
        var d = j / b, e = a * d;
        return Math.round(e * Math.cos(d * c))
    }, m = function (a, b, c) {
        return Math.round(a * k * Math.pow(2, -10 * c / b + 1) / b)
    }, n = function (a, b, c, d) {
        return 2 * c / Math.PI * Math.asin((d - a) / b)
    }, o = function (b) {
        var c = a(this).data("enscroll"), d = this, e = c.settings, f = function () {
            var b = a(this).data("enscroll"), c = b.settings;
            b && c.showOnHover && (c.verticalScrolling && a(b.verticalTrackWrapper).is(":visible") && a(b.verticalTrackWrapper).stop().fadeTo(275, 0), c.horizontalScrolling && a(b.horizontalTrackWrapper).is(":visible") && a(b.horizontalTrackWrapper).stop().fadeTo(275, 0), b._fadeTimer = null)
        };
        c && e.showOnHover && (c._fadeTimer ? clearTimeout(c._fadeTimer) : (e.verticalScrolling && a(c.verticalTrackWrapper).is(":visible") && a(c.verticalTrackWrapper).stop().fadeTo(275, 1), e.horizontalScrolling && a(c.horizontalTrackWrapper).is(":visible") && a(c.horizontalTrackWrapper).stop().fadeTo(275, 1)), b !== !1 && (c._fadeTimer = setTimeout(function () {
            f.call(d)
        }, 1750)))
    }, p = function (b, c) {
        var d = a(b), e = d.data("enscroll"), f = d.scrollTop();
        e && e.settings.verticalScrolling && (d.scrollTop(f + c), e.settings.showOnHover && o.call(b))
    }, q = function (b, c) {
        var d = a(b), e = d.data("enscroll"), f = d.scrollLeft();
        e && e.settings.horizontalScrolling && (d.scrollLeft(f + c), e.settings.showOnHover && o.call(b))
    }, r = function (b) {
        if (1 === b.which) {
            var d, e, f, h, i, j, k, l, m, n = b.data.pane, p = a(n), q = p.data("enscroll"), r = !0, s = function () {
                r && (f !== h && (q._scrollingY || (q._scrollingY = !0, q._startY = p.scrollTop(), g(function () {
                    t(p)
                })), e.style.top = f + "px", q._endY = f * m / l, h = f), g(s), q.settings.showOnHover && o.call(n))
            }, u = function (a) {
                return r && (f = a.clientY - j - i, f = Math.min(0 > f ? 0 : f, l)), !1
            }, v = function () {
                return r = !1, c.body.style.cursor = k, this.style.cursor = "", d.removeClass("dragging"), a(c.body).off("mousemove.enscroll.vertical").off("mouseup.enscroll.vertical"), a(c).off("mouseout.enscroll.vertical"), p.on("scroll.enscroll.pane", function (a) {
                    x.call(this, a)
                }), !1
            };
            return d = a(q.verticalTrackWrapper).find(".enscroll-track"), e = d.children().first()[0], f = parseInt(e.style.top, 10), m = n.scrollHeight - (q._scrollHeightNoPadding ? a(n).height() : a(n).innerHeight()), i = b.clientY - a(e).offset().top, l = d.height() - a(e).outerHeight(), j = d.offset().top, p.off("scroll.enscroll.pane"), a(c.body).on({
                "mousemove.enscroll.vertical": u,
                "mouseup.enscroll.vertical": function (a) {
                    v.call(e, a)
                }
            }), a(c).on("mouseout.enscroll.vertical", function (a) {
                a.target.nodeName && "HTML" === a.target.nodeName.toUpperCase() && v.call(e, a)
            }), d.hasClass("dragging") || (d.addClass("dragging"), k = a(c.body).css("cursor"), this.style.cursor = c.body.style.cursor = "ns-resize"), g(s), !1
        }
    }, s = function (b) {
        if (1 === b.which) {
            var d, e, f, h, i, j, k, l, m, n = b.data.pane, p = a(n), q = a(n).data("enscroll"), r = !0, s = function () {
                r && (f !== h && (q._scrollingX || (q._scrollingX = !0, q._startX = p.scrollLeft(), g(function () {
                    t(p)
                })), e.style.left = f + "px", q._endX = f * i / m, h = f), g(s), q.settings.showOnHover && o.call(n))
            }, u = function (a) {
                return r && (f = a.clientX - k - j, f = Math.min(0 > f ? 0 : f, m)), !1
            }, v = function () {
                return r = !1, d.removeClass("dragging"), c.body.style.cursor = l, this.style.cursor = "", d.removeClass("dragging"), a(c.body).off("mousemove.enscroll.horizontal").off("mouseup.enscroll.horizontal"), a(c).off("mouseout.enscroll.horizontal"), p.on("scroll.enscroll.pane", function (a) {
                    x.call(this, a)
                }), !1
            };
            return d = a(q.horizontalTrackWrapper).find(".enscroll-track"), e = d.children().first()[0], f = parseInt(e.style.left, 10), i = n.scrollWidth - a(n).innerWidth(), j = b.clientX - a(e).offset().left, m = d.width() - a(e).outerWidth(), k = d.offset().left, p.off("scroll.enscroll.pane"), a(c.body).on({
                "mousemove.enscroll.horizontal": u,
                "mouseup.enscroll.horizontal": function (a) {
                    v.call(e, a)
                }
            }), a(c).on("mouseout.enscroll.horizontal", function (a) {
                a.target.nodeName && "HTML" === a.target.nodeName.toUpperCase() && v.call(e, a)
            }), d.hasClass("dragging") || (d.addClass("dragging"), l = a("body").css("cursor"), this.style.cursor = c.body.style.cursor = "ew-resize"), g(s), !1
        }
    }, t = function (a) {
        var b, c, d, e = a.data("enscroll"), f = e._duration;
        e._scrollingX === !0 && (b = e._endX - e._startX, 0 === b ? e._scrollingX = !1 : (c = a.scrollLeft(), d = n(e._startX, b, f, c), b > 0 ? c >= e._endX || c < e._startX ? e._scrollingX = !1 : (q(a, Math.max(1, l(b, f, d))), g(function () {
            t(a)
        })) : c <= e._endX || c > e._startX ? e._scrollingX = !1 : (q(a, Math.min(-1, l(b, f, d))), g(function () {
            t(a)
        })))), e._scrollingY === !0 && (b = e._endY - e._startY, 0 === b ? e._scrollingY = !1 : (c = a.scrollTop(), d = n(e._startY, b, f, c), b > 0 ? c >= e._endY || c < e._startY ? e._scrollingY = !1 : (p(a, Math.max(1, l(b, f, d))), g(function () {
            t(a)
        })) : c <= e._endY || c > e._startY ? e._scrollingY = !1 : (p(a, Math.min(-1, l(b, f, d))), g(function () {
            t(a)
        }))))
    }, u = function (a, b) {
        var c = a.data("enscroll"), d = a.scrollLeft(), e = a[0].scrollWidth - a.innerWidth();
        return !c.settings.horizontalScrolling || c._scrollingY ? !1 : (c._scrollingX || (c._scrollingX = !0, c._startX = d, c._endX = c._startX, g(function () {
            t(a)
        })), c._endX = b > 0 ? Math.min(d + b, e) : Math.max(0, d + b), 0 > b && d > 0 || b > 0 && e > d)
    }, v = function (a, b) {
        var c = a.data("enscroll"), d = a.scrollTop(), e = a[0].scrollHeight - (c._scrollHeightNoPadding ? a.height() : a.innerHeight());
        return !c.settings.verticalScrolling || c._scrollingX ? !1 : (c._scrollingY || (c._scrollingY = !0, c._startY = d, c._endY = c._startY, g(function () {
            t(a)
        })), c._endY = b > 0 ? Math.min(d + b, e) : Math.max(0, d + b), 0 > b && d > 0 || b > 0 && e > d)
    }, w = function (b) {
        var c, d = a(this), e = d.data("enscroll"), g = e.settings.scrollIncrement, h = "deltaX" in b ? -b.deltaX : "wheelDeltaX" in b ? b.wheelDeltaX : 0, i = "deltaY" in b ? -b.deltaY : "wheelDeltaY" in b ? b.wheelDeltaY : "wheelDelta" in b ? b.wheelDelta : 0;
        Math.abs(h) > Math.abs(i) ? (c = (h > 0 ? -g : g) << 2, (u(d, c) || !e.settings.propagateWheelEvent) && f(b)) : (c = (i > 0 ? -g : g) << 2, (v(d, c) || !e.settings.propagateWheelEvent) && f(b))
    }, x = function () {
        var b, c, d, e = a(this), f = e.data("enscroll");
        f && (f.settings.verticalScrolling && (c = a(f.verticalTrackWrapper).find(".enscroll-track")[0], b = c.firstChild, d = e.scrollTop() / (this.scrollHeight - (f._scrollHeightNoPadding ? e.height() : e.innerHeight())), d = isNaN(d) ? 0 : d, b.style.top = d * (a(c).height() - a(b).outerHeight()) + "px"), f.settings.horizontalScrolling && (c = a(f.horizontalTrackWrapper).find(".enscroll-track")[0], b = c.firstChild, d = e.scrollLeft() / (this.scrollWidth - e.innerWidth()), d = isNaN(d) ? 0 : d, b.style.left = d * (a(c).width() - a(b).innerWidth()) + "px"))
    }, y = function (b) {
        var c, d = a(this), e = d.data("enscroll");
        if (!/(input)|(select)|(textarea)/i.test(this.nodeName) && b.target === this && e) {
            switch (c = e.settings.scrollIncrement, b.keyCode) {
                case 32:
                case 34:
                    return v(d, d.height()), !1;
                case 33:
                    return v(d, -d.height()), !1;
                case 35:
                    return v(d, this.scrollHeight), !1;
                case 36:
                    return v(d, -this.scrollHeight), !1;
                case 37:
                    return u(d, -c), !1;
                case 38:
                    return v(d, -c), !1;
                case 39:
                    return u(d, c), !1;
                case 40:
                    return v(d, c), !1
            }
            return !0
        }
    }, z = function () {
        var b = this, d = a(b).data("enscroll").settings, e = !0, f = 0, h = 0, i = a(b).offset().top, j = i + a(b).outerHeight(), k = a(b).offset().left, l = k + a(b).outerWidth(), m = function (a) {
            var b = a.pageX, c = a.pageY;
            f = k > b ? b - k : b > l ? b - l : 0, h = i > c ? c - i : c > j ? c - j : 0
        }, n = function () {
            d.horizontalScrolling && f && q(b, parseInt(f / 4, 10)), d.verticalScrolling && h && p(b, parseInt(h / 4, 10)), e && g(n)
        }, o = function () {
            e = !1, a(c).off("mousemove.enscroll.pane").off("mouseup.enscroll.pane")
        };
        g(n), a(c).on({"mousemove.enscroll.pane": m, "mouseup.enscroll.pane": o})
    }, A = function (a) {
        var b, c, e, h, i, j, k, l = this, n = function (a) {
            b = a.touches[0].clientX, c = a.touches[0].clientY, e || (e = c === i && b === h ? d : Math.abs(i - c) > Math.abs(h - b) ? "y" : "x"), f(a)
        }, o = function () {
            j && ("y" === e ? (p(l, i - c), k = i - c, i = c) : "x" === e && (q(l, h - b), k = h - b, h = b), g(o))
        }, r = function () {
            var a = 0, b = Math.abs(1.5 * k);
            this.removeEventListener("touchmove", n, !1), this.removeEventListener("touchend", r, !1), j = !1, g(function c() {
                var d;
                a === b || j || (d = m(k, b, a), isNaN(d) || 0 === d || (a += 1, "y" === e ? p(l, d) : q(l, d), g(c)))
            })
        };
        1 === a.touches.length && (h = a.touches[0].clientX, i = a.touches[0].clientY, j = !0, this.addEventListener("touchmove", n, !1), this.addEventListener("touchend", r, !1), g(o))
    }, B = {
        reposition: function () {
            return this.each(function () {
                var b, c, d, e = a(this), f = e.data("enscroll"), g = function (a, b, c) {
                    a.style.left = b + "px", a.style.top = c + "px"
                };
                f && (d = e.position(), b = f.corner, f.settings.verticalScrolling && (c = f.verticalTrackWrapper, g(c, "right" === f.settings.verticalScrollerSide ? d.left + e.outerWidth() - a(c).width() - h(this, "border-right-width") : d.left + h(this, "border-left-width"), d.top + h(this, "border-top-width"))), f.settings.horizontalScrolling && (c = f.horizontalTrackWrapper, g(c, d.left + h(this, "border-left-width"), d.top + e.outerHeight() - a(c).height() - h(this, "border-bottom-width"))), b && g(b, d.left + e.outerWidth() - a(b).outerWidth() - h(this, "border-right-width"), d.top + e.outerHeight() - a(b).outerHeight() - h(this, "border-bottom-width")))
            })
        }, resize: function () {
            return this.each(function () {
                var b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r = a(this), s = r.data("enscroll");
                return s ? (b = s.settings, r.is(":visible") ? (b.verticalScrolling && (e = s.verticalTrackWrapper, c = r.innerHeight(), f = c / this.scrollHeight, g = a(e).find(".enscroll-track")[0], j = a(e).find("." + b.scrollUpButtonClass), k = a(e).find("." + b.scrollDownButtonClass), i = b.horizontalScrolling ? c - a(s.horizontalTrackWrapper).find(".enscroll-track").outerHeight() : c, i -= a(g).outerHeight() - a(g).height() + j.outerHeight() + k.outerHeight(), n = g.firstChild, p = Math.max(f * i, b.minScrollbarLength), p -= a(n).outerHeight() - a(n).height(), e.style.display = "none", g.style.height = i + "px", n.style.height = p + "px", 1 > f && (f = r.scrollTop() / (this.scrollHeight - r.height()), n.style.top = f * (i - p) + "px", e.style.display = "block")), b.horizontalScrolling && (e = s.horizontalTrackWrapper, d = r.innerWidth(), f = d / this.scrollWidth, g = a(e).find(".enscroll-track")[0], l = a(e).find("." + b.scrollLeftButtonClass), m = a(e).find("." + b.scrollRightButtonClass), h = b.verticalScrolling ? d - a(s.verticalTrackWrapper).find(".enscroll-track").outerWidth() : d, h -= a(g).outerWidth() - a(g).width() + l.outerWidth() + m.outerWidth(), n = g.firstChild, o = Math.max(f * h, b.minScrollbarLength), o -= a(n).outerWidth() - a(n).width(), e.style.display = "none", g.style.width = h + "px", n.style.width = o + "px", 1 > f && (f = r.scrollLeft() / (this.scrollWidth - r.width()), n.style.left = f * (h - o) + "px", e.style.display = "block"), s._prybar && (q = s._prybar, this.removeChild(q), b.verticalScrolling && (q.style.width = this.scrollWidth + a(s.verticalTrackWrapper).find(".enscroll-track").outerWidth() + "px", this.appendChild(q)))), s.corner && (s.corner.style.display = s.verticalTrackWrapper && s.horizontalTrackWrapper && a(s.verticalTrackWrapper).is(":visible") && a(s.horizontalTrackWrapper).is(":visible") ? "" : "none")) : (b.verticalScrolling && (s.verticalTrackWrapper.style.display = "none"), b.horizontalScrolling && (s.horizontalTrackWrapper.style.display = "none"), s.corner && (s.corner.style.display = "none")), void 0) : !0
            })
        }, startPolling: function () {
            return this.each(function () {
                var b, c = a(this).data("enscroll"), d = this, e = a(d), f = -1, g = -1, h = -1, i = -1, j = function () {
                    if (c.settings.pollChanges) {
                        var a = d.scrollWidth, k = d.scrollHeight, l = e.width(), m = e.height(), n = e.offset();
                        (c.settings.verticalScrolling && (m !== g || k !== i) || c.settings.horizontalScrolling && (l !== f || a !== h)) && (h = a, i = k, B.resize.call(e)), (b.left !== n.left || b.top !== n.top || l !== f || m !== g) && (b = n, f = l, g = m, B.reposition.call(e)), setTimeout(j, 350)
                    }
                };
                c && (c.settings.pollChanges = !0, i = d.scrollHeight, h = d.scrollWidth, b = e.offset(), j())
            })
        }, stopPolling: function () {
            return this.each(function () {
                var b = a(this).data("enscroll");
                b && (b.settings.pollChanges = !1)
            })
        }, destroy: function () {
            return this.each(function () {
                var c, d, e = a(this), f = e.data("enscroll");
                f && (B.stopPolling.call(e), d = f._mouseScrollHandler, f.settings.verticalScrolling && (c = f.verticalTrackWrapper, a(c).remove(), c = null), f.settings.horizontalScrolling && (c = f.horizontalTrackWrapper, a(c).remove(), c = null), f._fadeTimer && clearTimeout(f._fadeTimer), f.corner && a(f.corner).remove(), f._prybar && f._prybar.parentNode && f._prybar.parentNode === this && a(f._prybar).remove(), this.setAttribute("style", f._style || ""), f._hadTabIndex || e.removeAttr("tabindex"), e.off("scroll.enscroll.pane").off("keydown.enscroll.pane").off("mouseenter.enscroll.pane").off("mousedown.enscroll.pane").data("enscroll", null), this.removeEventListener ? (this.removeEventListener("wheel", d, !1), this.removeEventListener("mousewheel", d, !1), this.removeEventListener("touchstart", A, !1)) : this.detachEvent && this.detachEvent("onmousewheel", d), a(b).off("resize.enscroll.window"))
            })
        }
    };
    a.fn.enscroll = function (d) {
        var f;
        return B[d] ? B[d].call(this) : (f = a.extend({}, e, d), this.each(function () {
            if (f.verticalScrolling || f.horizontalScrolling) {
                var d, e, g, j, k, l, m, n, t, C, D, E, F, G, H, I, J, K, L = a(this), M = this, N = L.attr("style"), O = !0, P = {
                    position: "absolute",
                    "z-index": f.zIndex,
                    margin: 0,
                    padding: 0
                }, Q = function (a) {
                    w.call(M, a)
                }, R = function (b, c) {
                    "string" == typeof c ? a(b).html(c) : b.appendChild(c)
                };
                if (f.verticalScrolling) {
                    e = c.createElement("div"), j = c.createElement("div"), l = c.createElement("a"), a(j).css("position", "relative").addClass("enscroll-track").addClass(f.verticalTrackClass).appendTo(e), f.drawScrollButtons && (m = c.createElement("a"), n = c.createElement("a"), a(m).css({
                        display: "block",
                        "text-decoration": "none"
                    }).attr("href", "").html("&nbsp;").addClass(f.scrollUpButtonClass).on("click", function () {
                        return p(M, -f.scrollIncrement), !1
                    }).insertBefore(j), a(n).css({
                        display: "block",
                        "text-decoration": "none"
                    }).attr("href", "").html("&nbsp;").on("click", function () {
                        return p(M, f.scrollIncrement), !1
                    }).addClass(f.scrollDownButtonClass).appendTo(e)), f.clickTrackToScroll && a(j).on("click", function (b) {
                        b.target === this && v(L, b.pageY > a(l).offset().top ? L.height() : -L.height())
                    }), a(l).css({
                        position: "absolute",
                        "z-index": 1
                    }).attr("href", "").addClass(f.verticalHandleClass).mousedown({pane: this}, r).click(function () {
                        return !1
                    }).appendTo(j), R(l, f.verticalHandleHTML), a(e).css(P).insertAfter(this), f.showOnHover && a(e).css("opacity", 0).on("mouseover.enscroll.vertical", function () {
                        o.call(M, !1)
                    }).on("mouseout.enscroll.vertical", function () {
                        o.call(M)
                    }), E = a(j).outerWidth(), f.addPaddingToPane && (K = "right" === f.verticalScrollerSide ? {"padding-right": h(this, "padding-right") + E + "px"} : {"padding-left": h(this, "padding-left") + E + "px"}, L.css(a.extend({width: L.width() - E + "px"}, K)));
                    try {
                        I = parseInt(L.css("outline-width"), 10), 0 !== I && !isNaN(I) || "none" !== L.css("outline-style") || L.css("outline", "none")
                    } catch (S) {
                        L.css("outline", "none")
                    }
                }
                f.horizontalScrolling && (d = c.createElement("div"), g = c.createElement("div"), k = c.createElement("a"), a(g).css({
                    position: "relative",
                    "z-index": 1
                }).addClass("enscroll-track").addClass(f.horizontalTrackClass).appendTo(d), f.drawScrollButtons && (t = c.createElement("a"), C = c.createElement("a"), a(t).css("display", "block").attr("href", "").on("click", function () {
                    return q(M, -f.scrollIncrement), !1
                }).addClass(f.scrollLeftButtonClass).insertBefore(g), a(C).css("display", "block").attr("href", "").on("click", function () {
                    return q(M, f.scrollIncrement), !1
                }).addClass(f.scrollRightButtonClass).appendTo(d)), f.clickTrackToScroll && a(g).on("click", function (b) {
                    b.target === this && u(L, b.pageX > a(k).offset().left ? L.width() : -L.width())
                }), a(k).css({
                    position: "absolute",
                    "z-index": 1
                }).attr("href", "").addClass(f.horizontalHandleClass).click(function () {
                    return !1
                }).mousedown({pane: this}, s).appendTo(g), R(k, f.horizontalHandleHTML), a(d).css(P).insertAfter(this), f.showOnHover && a(d).css("opacity", 0).on("mouseover.enscroll.horizontal", function () {
                    o.call(M, !1)
                }).on("mouseout.enscroll.horizontal", function () {
                    o.call(M)
                }), D = a(g).outerHeight(), f.addPaddingToPane && L.css({
                    height: L.height() - D + "px",
                    "padding-bottom": parseInt(L.css("padding-bottom"), 10) + D + "px"
                }), J = document.createElement("div"), a(J).css({
                    width: "1px",
                    height: "1px",
                    visibility: "hidden",
                    padding: 0,
                    margin: "-1px"
                }).appendTo(this)), f.verticalScrolling && f.horizontalScrolling && f.drawCorner && (F = c.createElement("div"), a(F).addClass(f.cornerClass).css(P).insertAfter(this)), H = L.attr("tabindex"), H || (L.attr("tabindex", 0), O = !1);
                try {
                    G = L.css("outline"), (!G || G.length < 1) && L.css("outline", "none")
                } catch (S) {
                    L.css("outline", "none")
                }
                L.on({
                    "scroll.enscroll.pane": function (a) {
                        x.call(this, a)
                    }, "keydown.enscroll.pane": y, "mousedown.enscroll.pane": z
                }).css("overflow", "hidden").data("enscroll", {
                    settings: f,
                    horizontalTrackWrapper: d,
                    verticalTrackWrapper: e,
                    corner: F,
                    _prybar: J,
                    _mouseScrollHandler: Q,
                    _hadTabIndex: O,
                    _style: N,
                    _scrollingX: !1,
                    _scrollingY: !1,
                    _startX: 0,
                    _startY: 0,
                    _endX: 0,
                    _endY: 0,
                    _duration: parseInt(f.easingDuration / 16.66666, 10),
                    _scrollHeightNoPadding: i(this.nodeName)
                }), a(b).on("resize.enscroll.window", function () {
                    B.reposition.call(L)
                }), f.showOnHover && L.on("mouseenter.enscroll.pane", function () {
                    o.call(this)
                }), this.addEventListener ? ("onwheel" in this || "WheelEvent" in b && navigator.userAgent.toLowerCase().indexOf("msie") >= 0 ? this.addEventListener("wheel", Q, !1) : "onmousewheel" in this && this.addEventListener("mousewheel", Q, !1), this.addEventListener("touchstart", A, !1)) : this.attachEvent && this.attachEvent("onmousewheel", Q), f.pollChanges && B.startPolling.call(L), B.resize.call(L), B.reposition.call(L)
            }
        }))
    }
}(jQuery, window, document), jQuery.browser = jQuery.browser || {msie: !1};
var enscroll = {
    loaded: !1,
    fiddleLoaded: !1,
    width: -1,
    docData: [{
        property: "verticalScrolling",
        value: "true",
        description: "Whether to render the scrollbars on the right to scroll vertically when the content of the view pane has a height greater than the height of the view pane itself"
    }, {
        property: "horizontalScrolling",
        value: "false",
        description: "Whether to render the scrollbars on the bottom to scroll horizontally when the content of the view pane has a width greater than the width of the view pane itself"
    }, {
        property: "verticalScrollerSide",
        value: "right",
        description: 'The vertical scrollbar can be rendered on the left side of the view pane when this property is set to the string value "left"'
    }, {
        property: "showOnHover",
        value: "false",
        description: "When enabled, the scrollbar(s) will remain hidden until the user hovers the mouse cursor over the view pane. This feature is useful when creating a scrolling UI similar to Facebookâ€™s ticker on the News Feed"
    }, {
        property: "scrollIncrement",
        value: "40",
        description: "The distance(in pixels) the view pane should scroll when using the mousewheel or arrow keys on the keyboard"
    }, {
        property: "minScrollbarLength",
        value: "25",
        description: "The length of the scrollbar handles will vary in length according to the size of the content in the view pane. This property specifies a minimum length(in pixels) beyond which the scrollbar will not contract"
    }, {
        property: "pollChanges",
        value: "true",
        description: "Whether to listen for changes to the view pane including content being changed within the view pane, changes to the width and height of the view pane, and changes to the position of the view pane. If one of these changes is detected, the scrollbar(s) will be updated to reflect these new properties"
    }, {
        property: "addPaddingToPane",
        value: "true",
        description: "The scrollbars are rendered over top of the view pane, and as a result, the plugin adds padding to the right of the view pane when verticalScrolling is enabled, and padding to the bottom when horizontalScrolling is enabled. Setting this option to false will prevent the plugin from adding the padding (added in v. 1.4.1)"
    }, {
        property: "drawCorner",
        value: "true",
        description: "Whether to render a corner element at the bottom right of the view pane when both vertical and horizontal scrollbars are visible"
    }, {
        property: "drawScrollButtons",
        value: "false",
        description: "Whether to render up and down scroll buttons above and below the vertical scrollbar.  If the horizontal scrolling is enabled, left and right scroll buttons will be rendered to the left and right of the horizontal scrollbar"
    }, {
        property: "clickTrackToScroll",
        value: "true",
        description: "If set to true, the view pane will scroll up a page when you click the track above the handle, and scroll down a page when you click the track below the handle"
    }, {
        property: "propagateWheelEvent",
        value: "true",
        description: "Normally, scrolling the view pane to the top or bottom with the mouse wheel will cause the wheel event to propagate to its parent. Setting this property to false will prevent this behavior"
    }, {
        property: "verticalTrackClass",
        value: "'vertical-track'",
        description: "The CSS class name given to the track of the vertical scrollbar"
    }, {
        property: "horizontalTrackClass",
        value: "'horizontal-track'",
        description: "The CSS class name given to the track of the horizontal scrollbar"
    }, {
        property: "verticalHandleClass",
        value: "'vertical-handle'",
        description: "The CSS class name given to the handle of the vertical scrollbar"
    }, {
        property: "horizontalHandleClass",
        value: "'horizontal-handle'",
        description: "The CSS class name given to the handle of the horizontal scrollbar"
    }, {
        property: "cornerClass",
        value: "'scrollbar-corner'",
        description: "The CSS class name given to the corner element"
    }, {
        property: "scrollUpButtonClass",
        value: "'scroll-up-btn'",
        description: "The CSS class name given to the scroll up button above the vertical scrollbar track"
    }, {
        property: "scrollDownButtonClass",
        value: "'scroll-down-btn'",
        description: "The CSS class name given to the scroll down button below the vertical scrollbar track"
    }, {
        property: "scrollLeftButtonClass",
        value: "'scroll-left-btn'",
        description: "The CSS class name given to the scroll left button to the left of the horizontal scrollbar track"
    }, {
        property: "scrollRightButtonClass",
        value: "'scroll-right-btn'",
        description: "The CSS class name given to the scroll right button to the right of the horizontal scrollbar track"
    }, {
        property: "zIndex",
        value: "1",
        description: "The value of the z-index CSS property assigned to the parent element of each of the scrollbars"
    }, {
        property: "easingDuration",
        value: "500",
        description: "The amount of time in milliseconds the scroll animation takes to complete"
    }],
    renderDocs: function () {
        var a = document.getElementById("doc-content"), b = window.JST["templates/doc-table.handlebars"], c = window.JST["templates/doc-list.handlebars"];
        a && (a.innerHTML = b(enscroll.docData) + c(enscroll.docData))
    },
    changeTab: function () {
        var a = location.hash.toLowerCase(), b = null, c = function () {
            var b, c;
            $(".folder-content").css("min-height", $(".folder-content").find("section:visible").height()), "try-it-now" === a && (enscroll.fiddleLoaded = enscroll.fiddleLoaded || function () {
                    return b = "http://jsfiddle.net/jstoudt/PGuB5/", c = $("#try-it-now-section").find("iframe")[0], c.src && c.src === b || (c.src = b), !0
                }()), "demos" === a && enscroll.loadDemos()
        };
        switch ("#" === a.charAt(0) && (a = a.substring(1)), a) {
            case"features":
            case"documentation":
            case"demos":
            case"try-it-now":
                break;
            default:
                a = "overview"
        }
        $(".folder-tabs").find("a").removeClass("selected"), $(".folder-tabs").find('[rel="' + a + '"]').addClass("selected"), enscroll.loaded ? $(".folder-content").find("section:visible").stop().fadeOut("fast", function () {
            $("#" + a + "-section").stop().fadeIn("fast", function () {
                c()
            })
        }) : ($(".folder-content").find("section").css("display", "none"), b = document.getElementById(a + "-section"), b && (b.style.display = "block"), c(), enscroll.loaded = !0)
    },
    loadDemos: function () {
        $(".scrollpane").enscroll("destroy"), $("#scrollpane1").enscroll({
            verticalTrackClass: "track1",
            verticalHandleClass: "handle1",
            drawScrollButtons: !0,
            scrollUpButtonClass: "scroll-up1",
            scrollDownButtonClass: "scroll-down1"
        }), $("#scrollpane2").enscroll({
            horizontalScrolling: !0,
            verticalTrackClass: "track2-vertical",
            verticalHandleClass: "handle2-vertical",
            horizontalTrackClass: "track2-horizontal",
            horizontalHandleClass: "handle2-horizontal",
            cornerClass: "corner2"
        }), $("#scrollpane3").enscroll({
            showOnHover: !0,
            verticalTrackClass: "track3",
            verticalHandleClass: "handle3"
        }), $("#scrollpane4").enscroll({
            verticalTrackClass: "track4",
            verticalHandleClass: "handle4",
            minScrollbarLength: 28,
            zIndex: 5,
            addPaddingToPane: !1
        })
    },
    resize: function () {
        var a = "CSS1Compat" === document.compatMode && document.clientWidth ? document.clientWidth : document.body.clientWidth, b = function () {
            $("img[data-small]").each(function () {
                var a = $(this), b = a.attr("src");
                a.attr({src: a.attr("data-small"), "data-large": b}), a.removeAttr("data-small")
            })
        }, c = function () {
            $("img[data-large]").each(function () {
                var a = $(this), b = a.attr("src");
                a.attr({src: a.attr("data-large"), "data-small": b}), a.removeAttr("data-large")
            })
        };
        (768 > a && enscroll.width >= 768 || a >= 768 && enscroll.width < 768 || 480 > a && enscroll.width >= 480 || a >= 480 && enscroll.width < 480 || enscroll.width < 1) && (enscroll.loadDemos(), a >= 768 ? (enscroll.loaded = !1, enscroll.changeTab(), c()) : function () {
            for (var a = 0, c = ["overview", "features", "documentation", "demos", "overview-section", "features-section", "documentation-section", "demos-section"], d = c.length; d > a; a++)$(c[a]).css("display", "block");
            $("#try-it-now-section").css("display", "none"), b()
        }()), enscroll.width = a
    },
    trackClickEvent: function (a, b, c) {
        $(a).click(function () {
            _gaq.push(["_trackEvent", b, c])
        })
    }
};
$(function () {
    enscroll.renderDocs(), window.addEventListener ? window.addEventListener("hashchange", enscroll.changeTab, !1) : window.attachEvent && window.attachEvent("onhashchange", enscroll.changeTab), $(window).resize(enscroll.resize), window.addEventListener && window.addEventListener("orientationchange", enscroll.resize, !1), enscroll.resize(), $("#scroll-to-top").click(function () {
        return window.scroll(0, 0), !1
    }), $("a[data-tab-link]").click(function () {
        var a = this.href, b = 10, c = Math.round($(".cabinet").offset().top) - 20, d = -1, e = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || function (a) {
                setTimeout(a, 1e3 / 60)
            };
        return function f() {
            var g = "number" == typeof window.pageYOffset ? window.pageYOffset : document.documentElement ? document.documentElement.scrollTop : document.body.scrollTop;
            g === c || g === d ? window.location = a : (b = Math.min(++b, Math.abs(g - c)), window.scroll(0, c > g ? g + b : g - b), d = g, e(f))
        }(), !1
    }), $(".view-code").overlay({
        effect: "apple", mask: {color: "#000", opacity: .85}, onLoad: function (a) {
            var b = $(a.target.rel).find("iframe")[0];
            b && !b.src && (b.src = a.target.href)
        }
    }), $("#twitter-share-button").length && function (a, b, c) {
        var d, e = a.getElementsByTagName(b)[0];
        a.getElementById(c) || (d = a.createElement(b), d.id = c, d.src = "//platform.twitter.com/widgets.js", e.parentNode.insertBefore(d, e))
    }(document, "script", "twitter-wjs"), $("#g-plusone").length && function () {
        var a = document.createElement("script");
        a.async = !0, a.src = "https://apis.google.com/js/plusone.js";
        var b = document.getElementsByTagName("script")[0];
        b.parentNode.insertBefore(a, b)
    }();
    var a = {
        "site-logo": "Site Logo",
        "demo-btn": "Demo Button",
        "overview-tab": "Overview Tab",
        "features-tab": "Features Tab",
        "documentation-tab": "Documentation Tab",
        "demos-tab": "Demos Tab",
        "try-it-now-tab": "Try It Now Tab"
    };
    for (var b in a)a.hasOwnProperty(b) && enscroll.trackClickEvent(document.getElementById(b), "Navigation", a[b]);
    var c = document.getElementById("download-btn");
    enscroll.trackClickEvent(c, "Download", $(c).data("action"))
});
/*!jQuery Knob*/
/**
 * Downward compatible, touchable dial
 *
 * Version: 1.2.8
 * Requires: jQuery v1.7+
 *
 * Copyright (c) 2012 Anthony Terrien
 * Under MIT License (http://www.opensource.org/licenses/mit-license.php)
 *
 */
(function (d) {
    var b = {}, a = Math.max, c = Math.min;
    b.c = {};
    b.c.d = d(document);
    b.c.t = function (f) {
        return f.originalEvent.touches.length - 1
    };
    b.o = function () {
        var e = this;
        this.o = null;
        this.$ = null;
        this.i = null;
        this.g = null;
        this.v = null;
        this.cv = null;
        this.x = 0;
        this.y = 0;
        this.w = 0;
        this.h = 0;
        this.$c = null;
        this.c = null;
        this.t = 0;
        this.isInit = false;
        this.fgColor = null;
        this.pColor = null;
        this.dH = null;
        this.cH = null;
        this.eH = null;
        this.rH = null;
        this.scale = 1;
        this.relative = false;
        this.relativeWidth = false;
        this.relativeHeight = false;
        this.$div = null;
        this.run = function () {
            var f = function (i, h) {
                var g;
                for (g in h) {
                    e.o[g] = h[g]
                }
                e._carve().init();
                e._configure()._draw()
            };
            if (this.$.data("kontroled")) {
                return
            }
            this.$.data("kontroled", true);
            this.extend();
            this.o = d.extend({
                min: this.$.data("min") !== undefined ? this.$.data("min") : 0,
                max: this.$.data("max") !== undefined ? this.$.data("max") : 100,
                stopper: true,
                readOnly: this.$.data("readonly") || (this.$.attr("readonly") === "readonly"),
                cursor: (this.$.data("cursor") === true && 30) || this.$.data("cursor") || 0,
                thickness: (this.$.data("thickness") && Math.max(Math.min(this.$.data("thickness"), 1), 0.01)) || 0.35,
                lineCap: this.$.data("linecap") || "butt",
                width: this.$.data("width") || 200,
                height: this.$.data("height") || 200,
                displayInput: this.$.data("displayinput") == null || this.$.data("displayinput"),
                displayPrevious: this.$.data("displayprevious"),
                fgColor: this.$.data("fgcolor") || "#87CEEB",
                inputColor: this.$.data("inputcolor"),
                font: this.$.data("font") || "Arial",
                fontWeight: this.$.data("font-weight") || "bold",
                inline: false,
                step: this.$.data("step") || 1,
                rotation: this.$.data("rotation"),
                draw: null,
                change: null,
                cancel: null,
                release: null,
                format: function (g) {
                    return g
                },
                parse: function (g) {
                    return parseFloat(g)
                }
            }, this.o);
            this.o.flip = this.o.rotation === "anticlockwise" || this.o.rotation === "acw";
            if (!this.o.inputColor) {
                this.o.inputColor = this.o.fgColor
            }
            if (this.$.is("fieldset")) {
                this.v = {};
                this.i = this.$.find("input");
                this.i.each(function (g) {
                    var h = d(this);
                    e.i[g] = h;
                    e.v[g] = e.o.parse(h.val());
                    h.bind("change blur", function () {
                        var i = {};
                        i[g] = h.val();
                        e.val(i)
                    })
                });
                this.$.find("legend").remove()
            } else {
                this.i = this.$;
                this.v = this.o.parse(this.$.val());
                (this.v === "") && (this.v = this.o.min);
                this.$.bind("change blur", function () {
                    e.val(e._validate(e.o.parse(e.$.val())))
                })
            }
            (!this.o.displayInput) && this.$.hide();
            this.$c = d(document.createElement("canvas")).attr({width: this.o.width, height: this.o.height});
            this.$div = d('<div style="' + (this.o.inline ? "display:inline;" : "") + "width:" + this.o.width + "px;height:" + this.o.height + 'px;"></div>');
            this.$.wrap(this.$div).before(this.$c);
            this.$div = this.$.parent();
            if (typeof G_vmlCanvasManager !== "undefined") {
                G_vmlCanvasManager.initElement(this.$c[0])
            }
            this.c = this.$c[0].getContext ? this.$c[0].getContext("2d") : null;
            if (!this.c) {
                throw {
                    name: "CanvasNotSupportedException",
                    message: "Canvas not supported. Please use excanvas on IE8.0.",
                    toString: function () {
                        return this.name + ": " + this.message
                    }
                }
            }
            this.scale = (window.devicePixelRatio || 1) / (this.c.webkitBackingStorePixelRatio || this.c.mozBackingStorePixelRatio || this.c.msBackingStorePixelRatio || this.c.oBackingStorePixelRatio || this.c.backingStorePixelRatio || 1);
            this.relativeWidth = ((this.o.width % 1 !== 0) && this.o.width.indexOf("%"));
            this.relativeHeight = ((this.o.height % 1 !== 0) && this.o.height.indexOf("%"));
            this.relative = (this.relativeWidth || this.relativeHeight);
            this._carve();
            if (this.v instanceof Object) {
                this.cv = {};
                this.copy(this.v, this.cv)
            } else {
                this.cv = this.v
            }
            this.$.bind("configure", f).parent().bind("configure", f);
            this._listen()._configure()._xy().init();
            this.isInit = true;
            this.$.val(this.o.format(this.v));
            this._draw();
            return this
        };
        this._carve = function () {
            if (this.relative) {
                var f = this.relativeWidth ? this.$div.parent().width() * parseInt(this.o.width) / 100 : this.$div.parent().width(), g = this.relativeHeight ? this.$div.parent().height() * parseInt(this.o.height) / 100 : this.$div.parent().height();
                this.w = this.h = Math.min(f, g)
            } else {
                this.w = this.o.width;
                this.h = this.o.height
            }
            this.$div.css({width: this.w + "px", height: this.h + "px"});
            this.$c.attr({width: this.w, height: this.h});
            if (this.scale !== 1) {
                this.$c[0].width = this.$c[0].width * this.scale;
                this.$c[0].height = this.$c[0].height * this.scale;
                this.$c.width(this.w);
                this.$c.height(this.h)
            }
            return this
        };
        this._draw = function () {
            var f = true;
            e.g = e.c;
            e.clear();
            e.dH && (f = e.dH());
            (f !== false) && e.draw()
        };
        this._touch = function (f) {
            var g = function (i) {
                var h = e.xy2val(i.originalEvent.touches[e.t].pageX, i.originalEvent.touches[e.t].pageY);
                if (h == e.cv) {
                    return
                }
                if (e.cH && (e.cH(h) === false)) {
                    return
                }
                e.change(e._validate(h));
                e._draw()
            };
            this.t = b.c.t(f);
            g(f);
            b.c.d.bind("touchmove.k", g).bind("touchend.k", function () {
                b.c.d.unbind("touchmove.k touchend.k");
                e.val(e.cv)
            });
            return this
        };
        this._mouse = function (g) {
            var f = function (i) {
                var h = e.xy2val(i.pageX, i.pageY);
                if (h == e.cv) {
                    return
                }
                if (e.cH && (e.cH(h) === false)) {
                    return
                }
                e.change(e._validate(h));
                e._draw()
            };
            f(g);
            b.c.d.bind("mousemove.k", f).bind("keyup.k", function (h) {
                if (h.keyCode === 27) {
                    b.c.d.unbind("mouseup.k mousemove.k keyup.k");
                    if (e.eH && (e.eH() === false)) {
                        return
                    }
                    e.cancel()
                }
            }).bind("mouseup.k", function (h) {
                b.c.d.unbind("mousemove.k mouseup.k keyup.k");
                e.val(e.cv)
            });
            return this
        };
        this._xy = function () {
            var f = this.$c.offset();
            this.x = f.left;
            this.y = f.top;
            return this
        };
        this._listen = function () {
            if (!this.o.readOnly) {
                this.$c.bind("mousedown", function (f) {
                    f.preventDefault();
                    e._xy()._mouse(f)
                }).bind("touchstart", function (f) {
                    f.preventDefault();
                    e._xy()._touch(f)
                });
                this.listen()
            } else {
                this.$.attr("readonly", "readonly")
            }
            if (this.relative) {
                d(window).resize(function () {
                    e._carve().init();
                    e._draw()
                })
            }
            return this
        };
        this._configure = function () {
            if (this.o.draw) {
                this.dH = this.o.draw
            }
            if (this.o.change) {
                this.cH = this.o.change
            }
            if (this.o.cancel) {
                this.eH = this.o.cancel
            }
            if (this.o.release) {
                this.rH = this.o.release
            }
            if (this.o.displayPrevious) {
                this.pColor = this.h2rgba(this.o.fgColor, "0.4");
                this.fgColor = this.h2rgba(this.o.fgColor, "0.6")
            } else {
                this.fgColor = this.o.fgColor
            }
            return this
        };
        this._clear = function () {
            this.$c[0].width = this.$c[0].width
        };
        this._validate = function (f) {
            return (~~(((f < 0) ? -0.5 : 0.5) + (f / this.o.step))) * this.o.step
        };
        this.listen = function () {
        };
        this.extend = function () {
        };
        this.init = function () {
        };
        this.change = function (f) {
        };
        this.val = function (f) {
        };
        this.xy2val = function (f, g) {
        };
        this.draw = function () {
        };
        this.clear = function () {
            this._clear()
        };
        this.h2rgba = function (i, f) {
            var g;
            i = i.substring(1, 7);
            g = [parseInt(i.substring(0, 2), 16), parseInt(i.substring(2, 4), 16), parseInt(i.substring(4, 6), 16)];
            return "rgba(" + g[0] + "," + g[1] + "," + g[2] + "," + f + ")"
        };
        this.copy = function (j, h) {
            for (var g in j) {
                h[g] = j[g]
            }
        }
    };
    b.Dial = function () {
        b.o.call(this);
        this.startAngle = null;
        this.xy = null;
        this.radius = null;
        this.lineWidth = null;
        this.cursorExt = null;
        this.w2 = null;
        this.PI2 = 2 * Math.PI;
        this.extend = function () {
            this.o = d.extend({
                bgColor: this.$.data("bgcolor") || "#EEEEEE",
                angleOffset: this.$.data("angleoffset") || 0,
                angleArc: this.$.data("anglearc") || 360,
                inline: true
            }, this.o)
        };
        this.val = function (e, f) {
            if (null != e) {
                e = this.o.parse(e);
                if (f !== false && (e != this.v) && this.rH && (this.rH(e) === false)) {
                    return
                }
                this.cv = this.o.stopper ? a(c(e, this.o.max), this.o.min) : e;
                this.v = this.cv;
                this.$.val(this.o.format(this.v));
                this._draw()
            } else {
                return this.v
            }
        };
        this.xy2val = function (e, h) {
            var f, g;
            f = Math.atan2(e - (this.x + this.w2), -(h - this.y - this.w2)) - this.angleOffset;
            if (this.o.flip) {
                f = this.angleArc - f - this.PI2
            }
            if (this.angleArc != this.PI2 && (f < 0) && (f > -0.5)) {
                f = 0
            } else {
                if (f < 0) {
                    f += this.PI2
                }
            }
            g = ~~(0.5 + (f * (this.o.max - this.o.min) / this.angleArc)) + this.o.min;
            this.o.stopper && (g = a(c(g, this.o.max), this.o.min));
            return g
        };
        this.listen = function () {
            var h = this, g, f, l = function (q) {
                q.preventDefault();
                var p = q.originalEvent, n = p.detail || p.wheelDeltaX, m = p.detail || p.wheelDeltaY, o = h._validate(h.o.parse(h.$.val())) + (n > 0 || m > 0 ? h.o.step : n < 0 || m < 0 ? -h.o.step : 0);
                o = a(c(o, h.o.max), h.o.min);
                h.val(o, false);
                if (h.rH) {
                    clearTimeout(g);
                    g = setTimeout(function () {
                        h.rH(o);
                        g = null
                    }, 100);
                    if (!f) {
                        f = setTimeout(function () {
                            if (g) {
                                h.rH(o)
                            }
                            f = null
                        }, 200)
                    }
                }
            }, j, k, e = 1, i = {37: -h.o.step, 38: h.o.step, 39: h.o.step, 40: -h.o.step};
            this.$.bind("keydown", function (o) {
                var n = o.keyCode;
                if (n >= 96 && n <= 105) {
                    n = o.keyCode = n - 48
                }
                j = parseInt(String.fromCharCode(n));
                if (isNaN(j)) {
                    (n !== 13) && (n !== 8) && (n !== 9) && (n !== 189) && (n !== 190 || h.$.val().match(/\./)) && o.preventDefault();
                    if (d.inArray(n, [37, 38, 39, 40]) > -1) {
                        o.preventDefault();
                        var m = h.o.parse(h.$.val()) + i[n] * e;
                        h.o.stopper && (m = a(c(m, h.o.max), h.o.min));
                        h.change(m);
                        h._draw();
                        k = window.setTimeout(function () {
                            e *= 2
                        }, 30)
                    }
                }
            }).bind("keyup", function (m) {
                if (isNaN(j)) {
                    if (k) {
                        window.clearTimeout(k);
                        k = null;
                        e = 1;
                        h.val(h.$.val())
                    }
                } else {
                    (h.$.val() > h.o.max && h.$.val(h.o.max)) || (h.$.val() < h.o.min && h.$.val(h.o.min))
                }
            });
            this.$c.bind("mousewheel DOMMouseScroll", l);
            this.$.bind("mousewheel DOMMouseScroll", l)
        };
        this.init = function () {
            if (this.v < this.o.min || this.v > this.o.max) {
                this.v = this.o.min
            }
            this.$.val(this.v);
            this.w2 = this.w / 2;
            this.cursorExt = this.o.cursor / 100;
            this.xy = this.w2 * this.scale;
            this.lineWidth = this.xy * this.o.thickness;
            this.lineCap = this.o.lineCap;
            this.radius = this.xy - this.lineWidth / 2;
            this.o.angleOffset && (this.o.angleOffset = isNaN(this.o.angleOffset) ? 0 : this.o.angleOffset);
            this.o.angleArc && (this.o.angleArc = isNaN(this.o.angleArc) ? this.PI2 : this.o.angleArc);
            this.angleOffset = this.o.angleOffset * Math.PI / 180;
            this.angleArc = this.o.angleArc * Math.PI / 180;
            this.startAngle = 1.5 * Math.PI + this.angleOffset;
            this.endAngle = 1.5 * Math.PI + this.angleOffset + this.angleArc;
            var e = a(String(Math.abs(this.o.max)).length, String(Math.abs(this.o.min)).length, 2) + 2;
            this.o.displayInput && this.i.css({
                width: ((this.w / 2 + 4) >> 0) + "px",
                height: ((this.w / 3) >> 0) + "px",
                position: "absolute",
                "vertical-align": "middle",
                "margin-top": ((this.w / 3) >> 0) + "px",
                "margin-left": "-" + ((this.w * 3 / 4 + 2) >> 0) + "px",
                border: 0,
                background: "none",
                font: this.o.fontWeight + " " + ((this.w / e) >> 0) + "px " + this.o.font,
                "text-align": "center",
                color: this.o.inputColor || this.o.fgColor,
                padding: "0px",
                "-webkit-appearance": "none"
            }) || this.i.css({width: "0px", visibility: "hidden"})
        };
        this.change = function (e) {
            this.cv = e;
            this.$.val(this.o.format(e))
        };
        this.angle = function (e) {
            return (e - this.o.min) * this.angleArc / (this.o.max - this.o.min)
        };
        this.arc = function (f) {
            var e, g;
            f = this.angle(f);
            if (this.o.flip) {
                e = this.endAngle + 0.00001;
                g = e - f - 0.00001
            } else {
                e = this.startAngle - 0.00001;
                g = e + f + 0.00001
            }
            this.o.cursor && (e = g - this.cursorExt) && (g = g + this.cursorExt);
            return {s: e, e: g, d: this.o.flip && !this.o.cursor}
        };
        this.draw = function () {
            var h = this.g, e = this.arc(this.cv), f, g = 1;
            h.lineWidth = this.lineWidth;
            h.lineCap = this.lineCap;
            h.strokeStyle = this.o.bgColor;
            h.arc(this.xy, this.xy, this.radius, this.endAngle - 0.00001, this.startAngle + 0.00001, true);
            h.stroke();
            if (this.o.displayPrevious) {
                f = this.arc(this.v);
                h.beginPath();
                h.strokeStyle = this.pColor;
                h.arc(this.xy, this.xy, this.radius, f.s, f.e, f.d);
                h.stroke();
                g = (this.cv == this.v)
            }
            h.beginPath();
            h.strokeStyle = g ? this.o.fgColor : this.fgColor;
            h.arc(this.xy, this.xy, this.radius, e.s, e.e, e.d);
            h.stroke()
        };
        this.cancel = function () {
            this.val(this.v)
        }
    };
    d.fn.dial = d.fn.knob = function (e) {
        return this.each(function () {
            var f = new b.Dial();
            f.o = e;
            f.$ = d(this);
            f.run()
        }).parent()
    }
})(jQuery);

/*! Swipebox v1.2.9 | Constantin Saguin csag.co | MIT License | github.com/brutaldesign/swipebox */
(function (window, document, $, undefined) {
    $.swipebox = function (elem, options) {
        var ui, defaults = {
            useCSS: true,
            useSVG: false,
            initialIndexOnArray: 0,
            closeBySwipe: true,
            hideBarsOnMobile: true,
            hideBarsDelay: 3000,
            videoMaxWidth: 1140,
            vimeoColor: "CCCCCC",
            beforeOpen: null,
            afterOpen: null,
            afterClose: null
        }, plugin = this, elements = [], $elem, selector = elem.selector, $selector = $(selector), isMobile = navigator.userAgent.match(/(iPad)|(iPhone)|(iPod)|(Android)|(PlayBook)|(BB10)|(BlackBerry)|(Opera Mini)|(IEMobile)|(webOS)|(MeeGo)/i), isTouch = isMobile !== null || document.createTouch !== undefined || ("ontouchstart" in window) || ("onmsgesturechange" in window) || navigator.msMaxTouchPoints, supportSVG = !!document.createElementNS && !!document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect, winWidth = window.innerWidth ? window.innerWidth : $(window).width(), winHeight = window.innerHeight ? window.innerHeight : $(window).height(), html = '<div id="swipebox-overlay">					<div id="swipebox-slider"></div>					<div id="swipebox-caption"></div>					<div id="swipebox-action">						<a id="swipebox-close"><i class="remove sign icon"></i></a>						<a id="swipebox-prev"><i class="left arrow icon"></i></a>						<a id="swipebox-next"><i class="right arrow icon"></i></a>					</div>			</div>';
        plugin.settings = {};
        plugin.init = function () {
            plugin.settings = $.extend({}, defaults, options);
            if ($.isArray(elem)) {
                elements = elem;
                ui.target = $(window);
                ui.init(plugin.settings.initialIndexOnArray)
            } else {
                $(document).on("click", selector, function (event) {
                    if (event.target.parentNode.className === "slide current") {
                        return false
                    }
                    if (!$.isArray(elem)) {
                        ui.destroy();
                        $elem = $(selector);
                        ui.actions()
                    }
                    elements = [];
                    var index, relType, relVal;
                    if (!relVal) {
                        relType = "data-rel";
                        relVal = $(this).attr(relType)
                    }
                    if (!relVal) {
                        relType = "rel";
                        relVal = $(this).attr(relType)
                    }
                    if (relVal && relVal !== "" && relVal !== "nofollow") {
                        $elem = $selector.filter("[" + relType + '="' + relVal + '"]')
                    } else {
                        $elem = $(selector)
                    }
                    $elem.each(function () {
                        var title = null, href = null;
                        if ($(this).attr("title")) {
                            title = $(this).attr("title")
                        }
                        if ($(this).attr("href")) {
                            href = $(this).attr("href")
                        }
                        elements.push({href: href, title: title})
                    });
                    index = $elem.index($(this));
                    event.preventDefault();
                    event.stopPropagation();
                    ui.target = $(event.target);
                    ui.init(index)
                })
            }
        };
        ui = {
            init: function (index) {
                if (plugin.settings.beforeOpen) {
                    plugin.settings.beforeOpen()
                }
                this.target.trigger("swipebox-start");
                $.swipebox.isOpen = true;
                this.build();
                this.openSlide(index);
                this.openMedia(index);
                this.preloadMedia(index + 1);
                this.preloadMedia(index - 1);
                if (plugin.settings.afterOpen) {
                    plugin.settings.afterOpen()
                }
            }, build: function () {
                var $this = this, bg;
                $("body").append(html);
                if ($this.doCssTrans()) {
                    $("#swipebox-slider").css({
                        "-webkit-transition": "left 0.4s ease",
                        "-moz-transition": "left 0.4s ease",
                        "-o-transition": "left 0.4s ease",
                        "-khtml-transition": "left 0.4s ease",
                        transition: "left 0.4s ease"
                    });
                    $("#swipebox-overlay").css({
                        "-webkit-transition": "opacity 1s ease",
                        "-moz-transition": "opacity 1s ease",
                        "-o-transition": "opacity 1s ease",
                        "-khtml-transition": "opacity 1s ease",
                        transition: "opacity 1s ease"
                    });
                    $("#swipebox-action, #swipebox-caption").css({
                        "-webkit-transition": "0.5s",
                        "-moz-transition": "0.5s",
                        "-o-transition": "0.5s",
                        "-khtml-transition": "0.5s",
                        transition: "0.5s"
                    })
                }
                if (supportSVG && plugin.settings.useSVG === true) {
                    bg = $("#swipebox-action #swipebox-close").css("background-image");
                    bg = bg.replace("png", "svg");
                    $("#swipebox-action #swipebox-prev,#swipebox-action #swipebox-next,#swipebox-action #swipebox-close").css({"background-image": bg})
                }
                if (isMobile && plugin.settings.hideBarsOnMobile === true) {
                    $("#swipebox-action, #swipebox-caption").hide()
                }
                $.each(elements, function () {
                    $("#swipebox-slider").append('<div class="slide"></div>')
                });
                $this.setDim();
                $this.actions();
                if (isTouch) {
                    $this.gesture()
                }
                $this.keyboard();
                $this.animBars();
                $this.resize()
            }, setDim: function () {
                var width, height, sliderCss = {};
                if ("onorientationchange" in window) {
                    window.addEventListener("orientationchange", function () {
                        if (window.orientation === 0) {
                            width = winWidth;
                            height = winHeight
                        } else {
                            if (window.orientation === 90 || window.orientation === -90) {
                                width = winHeight;
                                height = winWidth
                            }
                        }
                    }, false)
                } else {
                    width = window.innerWidth ? window.innerWidth : $(window).width();
                    height = window.innerHeight ? window.innerHeight : $(window).height()
                }
                sliderCss = {width: width, height: height};
                $("#swipebox-overlay").css(sliderCss)
            }, resize: function () {
                var $this = this;
                $(window).resize(function () {
                    $this.setDim()
                }).resize()
            }, supportTransition: function () {
                var prefixes = "transition WebkitTransition MozTransition OTransition msTransition KhtmlTransition".split(" "), i;
                for (i = 0; i < prefixes.length; i++) {
                    if (document.createElement("div").style[prefixes[i]] !== undefined) {
                        return prefixes[i]
                    }
                }
                return false
            }, doCssTrans: function () {
                if (plugin.settings.useCSS && this.supportTransition()) {
                    return true
                }
            }, gesture: function () {
                var $this = this, distance = null, vDistance = null, vSwipe = false, swipMinDistance = 10, vSwipMinDistance = 50, startCoords = {}, endCoords = {}, bars = $("#swipebox-caption, #swipebox-action"), slider = $("#swipebox-slider");
                bars.addClass("visible-bars");
                $this.setTimeout();
                $("body").bind("touchstart", function (event) {
                    $(this).addClass("touching");
                    endCoords = event.originalEvent.targetTouches[0];
                    startCoords.pageX = event.originalEvent.targetTouches[0].pageX;
                    startCoords.pageY = event.originalEvent.targetTouches[0].pageY;
                    $(".touching").bind("touchmove", function (event) {
                        event.preventDefault();
                        event.stopPropagation();
                        endCoords = event.originalEvent.targetTouches[0];
                        if (plugin.settings.closeBySwipe) {
                            vDistance = endCoords.pageY - startCoords.pageY;
                            if (Math.abs(vDistance) >= vSwipMinDistance || vSwipe) {
                                var opacity = 0.75 - Math.abs(vDistance) / slider.height();
                                slider.css({top: vDistance + "px"});
                                slider.css({opacity: opacity});
                                vSwipe = true
                            }
                        }
                    });
                    return false
                }).bind("touchend", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    if (plugin.settings.closeBySwipe) {
                        if (slider.css("opacity") <= 0.5) {
                            var vOffset = vDistance > 0 ? slider.height() : -slider.height();
                            slider.animate({top: vOffset + "px", opacity: 0}, 300, function () {
                                $this.closeSlide()
                            })
                        } else {
                            slider.animate({top: 0, opacity: 1}, 300)
                        }
                        if (vSwipe) {
                            vSwipe = false;
                            return
                        }
                    }
                    distance = endCoords.pageX - startCoords.pageX;
                    if (distance >= swipMinDistance) {
                        $this.getPrev()
                    } else {
                        if (distance <= -swipMinDistance) {
                            $this.getNext()
                        } else {
                            if (!bars.hasClass("visible-bars")) {
                                $this.showBars();
                                $this.setTimeout()
                            } else {
                                $this.clearTimeout();
                                $this.hideBars()
                            }
                        }
                    }
                    $(".touching").off("touchmove").removeClass("touching")
                })
            }, setTimeout: function () {
                if (plugin.settings.hideBarsDelay > 0) {
                    var $this = this;
                    $this.clearTimeout();
                    $this.timeout = window.setTimeout(function () {
                        $this.hideBars()
                    }, plugin.settings.hideBarsDelay)
                }
            }, clearTimeout: function () {
                window.clearTimeout(this.timeout);
                this.timeout = null
            }, showBars: function () {
                var bars = $("#swipebox-caption, #swipebox-action");
                if (this.doCssTrans()) {
                    bars.addClass("visible-bars")
                } else {
                    $("#swipebox-caption").animate({top: 0}, 500);
                    $("#swipebox-action").animate({bottom: 0}, 500);
                    setTimeout(function () {
                        bars.addClass("visible-bars")
                    }, 1000)
                }
            }, hideBars: function () {
                var bars = $("#swipebox-caption, #swipebox-action");
                if (this.doCssTrans()) {
                    bars.removeClass("visible-bars")
                } else {
                    $("#swipebox-caption").animate({top: "-50px"}, 500);
                    $("#swipebox-action").animate({bottom: "-50px"}, 500);
                    setTimeout(function () {
                        bars.removeClass("visible-bars")
                    }, 1000)
                }
            }, animBars: function () {
                var $this = this, bars = $("#swipebox-caption, #swipebox-action");
                bars.addClass("visible-bars");
                $this.setTimeout();
                $("#swipebox-slider").click(function () {
                    if (!bars.hasClass("visible-bars")) {
                        $this.showBars();
                        $this.setTimeout()
                    }
                });
                $("#swipebox-action").hover(function () {
                    $this.showBars();
                    bars.addClass("visible-bars");
                    $this.clearTimeout()
                }, function () {
                    bars.removeClass("visible-bars");
                    $this.setTimeout()
                })
            }, keyboard: function () {
                var $this = this;
                $(window).bind("keyup", function (event) {
                    event.preventDefault();
                    event.stopPropagation();
                    if (event.keyCode === 37) {
                        $this.getPrev()
                    } else {
                        if (event.keyCode === 39) {
                            $this.getNext()
                        } else {
                            if (event.keyCode === 27) {
                                $this.closeSlide()
                            }
                        }
                    }
                })
            }, actions: function () {
                var $this = this, action = "touchend click";
                if (elements.length < 2) {
                    $("#swipebox-prev, #swipebox-next").hide()
                } else {
                    $("#swipebox-prev").on(action, function (event) {
                        event.preventDefault();
                        event.stopPropagation();
                        $this.getPrev();
                        $this.setTimeout()
                    });
                    $("#swipebox-next").on(action, function (event) {
                        event.preventDefault();
                        event.stopPropagation();
                        $this.getNext();
                        $this.setTimeout()
                    })
                }
                $("#swipebox-close").bind(action, function () {
                    $this.closeSlide()
                })
            }, setSlide: function (index, isFirst) {
                isFirst = isFirst || false;
                var slider = $("#swipebox-slider");
                if (this.doCssTrans()) {
                    slider.css({left: (-index * 100) + "%"})
                } else {
                    slider.animate({left: (-index * 100) + "%"})
                }
                $("#swipebox-slider .slide").removeClass("current");
                $("#swipebox-slider .slide").eq(index).addClass("current");
                this.setTitle(index);
                if (isFirst) {
                    slider.fadeIn()
                }
                $("#swipebox-prev, #swipebox-next").removeClass("disabled");
                if (index === 0) {
                    $("#swipebox-prev").addClass("disabled")
                } else {
                    if (index === elements.length - 1) {
                        $("#swipebox-next").addClass("disabled")
                    }
                }
            }, openSlide: function (index) {
                $("html").addClass("swipebox-html");
                if (isTouch) {
                    $("html").addClass("swipebox-touch")
                }
                $(window).trigger("resize");
                this.setSlide(index, true)
            }, preloadMedia: function (index) {
                var $this = this, src = null;
                if (elements[index] !== undefined) {
                    src = elements[index].href
                }
                if (!$this.isVideo(src)) {
                    setTimeout(function () {
                        $this.openMedia(index)
                    }, 1000)
                } else {
                    $this.openMedia(index)
                }
            }, openMedia: function (index) {
                var $this = this, src = null;
                if (elements[index] !== undefined) {
                    src = elements[index].href
                }
                if (index < 0 || index >= elements.length) {
                    return false
                }
                if (!$this.isVideo(src)) {
                    $this.loadMedia(src, function () {
                        $("#swipebox-slider .slide").eq(index).html(this)
                    })
                } else {
                    $("#swipebox-slider .slide").eq(index).html($this.getVideo(src))
                }
            }, setTitle: function (index) {
                var title = null;
                $("#swipebox-caption").empty();
                if (elements[index] !== undefined) {
                    title = elements[index].title
                }
                if (title) {
                    $("#swipebox-caption").append(title)
                }
            }, isVideo: function (src) {
                if (src) {
                    if (src.match(/youtube\.com\/watch\?v=([a-zA-Z0-9\-_]+)/) || src.match(/vimeo\.com\/([0-9]*)/) || src.match(/youtu\.be\/([a-zA-Z0-9\-_]+)/)) {
                        return true
                    }
                }
            }, getVideo: function (url) {
                var iframe = "", youtubeUrl = url.match(/watch\?v=([a-zA-Z0-9\-_]+)/), youtubeShortUrl = url.match(/youtu\.be\/([a-zA-Z0-9\-_]+)/), vimeoUrl = url.match(/vimeo\.com\/([0-9]*)/);
                if (youtubeUrl || youtubeShortUrl) {
                    if (youtubeShortUrl) {
                        youtubeUrl = youtubeShortUrl
                    }
                    iframe = '<iframe width="560" height="315" src="//www.youtube.com/embed/' + youtubeUrl[1] + '" frameborder="0" allowfullscreen></iframe>'
                } else {
                    if (vimeoUrl) {
                        iframe = '<iframe width="560" height="315"  src="//player.vimeo.com/video/' + vimeoUrl[1] + "?byline=0&amp;portrait=0&amp;color=" + plugin.settings.vimeoColor + '" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>'
                    }
                }
                return '<div class="swipebox-video-container" style="max-width:' + plugin.settings.videomaxWidth + 'px"><div class="swipebox-video">' + iframe + "</div></div>"
            }, loadMedia: function (src, callback) {
                if (!this.isVideo(src)) {
                    var img = $("<img>").on("load", function () {
                        callback.call(img)
                    });
                    img.attr("src", src)
                }
            }, getNext: function () {
                var $this = this, index = $("#swipebox-slider .slide").index($("#swipebox-slider .slide.current"));
                if (index + 1 < elements.length) {
                    index++;
                    $this.setSlide(index);
                    $this.preloadMedia(index + 1)
                } else {
                    $("#swipebox-slider").addClass("rightSpring");
                    setTimeout(function () {
                        $("#swipebox-slider").removeClass("rightSpring")
                    }, 500)
                }
            }, getPrev: function () {
                var index = $("#swipebox-slider .slide").index($("#swipebox-slider .slide.current"));
                if (index > 0) {
                    index--;
                    this.setSlide(index);
                    this.preloadMedia(index - 1)
                } else {
                    $("#swipebox-slider").addClass("leftSpring");
                    setTimeout(function () {
                        $("#swipebox-slider").removeClass("leftSpring")
                    }, 500)
                }
            }, closeSlide: function () {
                $("html").removeClass("swipebox-html");
                $("html").removeClass("swipebox-touch");
                $(window).trigger("resize");
                this.destroy()
            }, destroy: function () {
                $(window).unbind("keyup");
                $("body").unbind("touchstart");
                $("body").unbind("touchmove");
                $("body").unbind("touchend");
                $("#swipebox-slider").unbind();
                $("#swipebox-overlay").remove();
                if (!$.isArray(elem)) {
                    elem.removeData("_swipebox")
                }
                if (this.target) {
                    this.target.trigger("swipebox-destroy")
                }
                $.swipebox.isOpen = false;
                if (plugin.settings.afterClose) {
                    plugin.settings.afterClose()
                }
            }
        };
        plugin.init()
    };
    $.fn.swipebox = function (options) {
        if (!$.data(this, "_swipebox")) {
            var swipebox = new $.swipebox(this, options);
            this.data("_swipebox", swipebox)
        }
        return this.data("_swipebox")
    }
}(window, document, jQuery));
/*! Grid boxes */
(function ($) {
    $.elasticColumns = function (element, options) {
        this.defaults = {columns: 3, innerMargin: 10, outerMargin: 10, hasMask: 1};
        this.settings = {};
        this.$element = $(element);
        this.columns = [];
        this.init = function () {
            this.settings = $.extend({}, this.defaults, options);
            this.buildLayout()
        };
        this.buildLayout = function () {
            var $items = this.$element.children(":not(.elastic-columns-ignore)");
            var container_width = this.$element.width();
            var column_width = (container_width - (this.settings.innerMargin * (this.settings.columns - 1)) - (this.settings.outerMargin * 2)) / this.settings.columns;
            for (var index = 0; index < this.settings.columns; index += 1) {
                this.columns[index] = this.settings.outerMargin
            }
            for (var item_id = 0; item_id < $items.length; item_id += 1) {
                var $item = $($items.get(item_id));
                var smallest_column = 0;
                for (var column_id = 0; column_id < this.settings.columns; column_id += 1) {
                    if (this.columns[column_id] < this.columns[smallest_column]) {
                        smallest_column = column_id
                    }
                }
                var horizontal_padding = parseInt($item.css("padding-left")) + parseInt($item.css("padding-right"));
                var vertical_padding = parseInt($item.css("padding-top")) + parseInt($item.css("padding-bottom"));
                $item.css("position", "absolute");
                $item.css("width", (column_width - horizontal_padding) + "px");
                $item.css("left", (this.settings.outerMargin + (this.settings.innerMargin * smallest_column) + (smallest_column * column_width)) + "px");
                $item.css("top", this.columns[smallest_column] + "px");
                this.columns[smallest_column] += $item.outerHeight() + this.settings.innerMargin + vertical_padding;
                if (this.settings.hasMask) {
                    $($item).each(function () {
                        $rev = $(this).children(".reveal");
                        $mask = $(this).find(".mask");
                        var height = $rev.height();
                        $($mask).css("height", height)
                    })
                }
            }
            var highest_column = 0;
            for (var column_id = 0; column_id < this.settings.columns; column_id += 1) {
                if (this.columns[column_id] > this.columns[highest_column]) {
                    highest_column = column_id
                }
            }
            this.$element.outerHeight(this.columns[highest_column] + "px")
        };
        this.destroyLayout = function () {
            var $items = this.$element.children(":not(.elastic-columns-ignore)");
            for (var item_id = 0; item_id < $items.length; item_id += 1) {
                var $item = $($items.get(item_id));
                $item.css({position: "", width: "", left: "", top: ""})
            }
            this.$element.css({height: ""})
        }
    };
    $.fn.elasticColumns = function (options, option, value) {
        return this.each(function () {
            var plugin = $(this).data("elasticColumns");
            if (typeof plugin == "undefined") {
                plugin = new $.elasticColumns(this, options);
                $(this).data("elasticColumns", plugin);
                plugin.init()
            } else {
                if (options == "refresh") {
                    plugin.buildLayout()
                }
                if (options == "set") {
                    plugin.settings[option] = value
                }
                if (options == "destroy") {
                    plugin.destroyLayout()
                }
            }
        })
    }
})(jQuery);
/*!=========================================================================
 *  jQuery Color Picker Sliders
 *  v3.1.0
 *  https://github.com/istvan-ujjmeszaros/jquery-colorpickersliders
 *  http://virtuosoft.eu/code/jquery-colorpickersliders/
 * ====================================================================== */
(function (e) {
    "use strict";
    e.fn.ColorPickerSliders = function (t) {
        return this.each(function () {
            function p() {
                if (n) {
                    return
                }
                n = true;
                g();
                y();
                b();
                if (i.is("input")) {
                    c.tiny = tinycolor(i.val());
                    if (!c.tiny.format) {
                        c.tiny = tinycolor(r.color)
                    }
                } else {
                    c.tiny = tinycolor(r.color)
                }
                c.hsla = c.tiny.toHsl();
                c.rgba = c.tiny.toRgb();
                c.cielch = e.fn.ColorPickerSliders.rgb2lch(c.rgba);
                T();
                S();
                P()
            }

            function d(t, n) {
                var r = tinycolor(t);
                if (r.format) {
                    s.removeClass("cp-unconvertible-cie-color");
                    c.tiny = r;
                    c.hsla = r.toHsl();
                    c.rgba = r.toRgb();
                    c.cielch = e.fn.ColorPickerSliders.rgb2lch(c.rgba);
                    P(n);
                    return true
                } else {
                    return false
                }
            }

            function v() {
                e(".cp-container.cp-popup").hide();
                var t = e(window).width(), n = i.offset(), r;
                r = s.data("popup-original-width");
                if (typeof r === "undefined") {
                    r = s.outerWidth();
                    s.data("popup-original-width", r)
                }
                if (n.left + r + 12 <= t) {
                    s.css("left", n.left).width(r)
                } else if (r <= t) {
                    s.css("left", t - r - 12).width(r)
                } else {
                    s.css("left", 0).width(t - 12)
                }
                s.css("top", n.top + i.outerHeight()).show()
            }

            function m() {
                s.hide()
            }

            function g() {
                r = e.extend({
                    color: "hsl(342, 52%, 70%)",
                    swatches: ["FFFFFF", "C0C0C0", "808080", "000000", "FF0000", "800000", "FFFF00", "808000", "00FF00", "008000", "00FFFF", "008080", "0000FF", "000080", "FF00FF", "800080"],
                    customswatches: false,
                    connectedinput: false,
                    flat: false,
                    disableautopopup: false,
                    updateinterval: 30,
                    previewontriggerelement: true,
                    previewcontrasttreshold: 15,
                    previewformat: "rgb",
                    erroneousciecolormarkers: true,
                    invalidcolorsopacity: 1,
                    finercierangeedges: true,
                    titleswatchesadd: "Add color to swatches",
                    titleswatchesremove: "Remove color from swatches",
                    titleswatchesreset: "Reset to default swatches",
                    order: {},
                    labels: {},
                    onchange: function () {
                    }
                }, t);
                if (t.hasOwnProperty("order")) {
                    r.order = e.extend({opacity: false, hsl: false, rgb: false, cie: false, preview: false}, t.order)
                } else {
                    r.order = {rgb: 1, preview: false}
                }
                if (!t.hasOwnProperty("labels")) {
                    t.labels = {}
                }
                r.labels = e.extend({
                    hslhue: "HSL-Hue",
                    hslsaturation: "HSL-Saturation",
                    hsllightness: "HSL-Lightness",
                    rgbred: "RGB-Red",
                    rgbgreen: "RGB-Green",
                    rgbblue: "RGB-Blue",
                    cielightness: "CIE-Lightness",
                    ciechroma: "CIE-Chroma",
                    ciehue: "CIE-hue",
                    opacity: "Opacity",
                    preview: "Preview"
                }, t.labels);
                if ((!r.order.hasOwnProperty("preview") || r.order.preview === false) && !e.fn.ColorPickerSliders.gradientSupported()) {
                    r.order.preview = 10
                }
            }

            function y() {
                var t = [], n = "";
                if (r.order.opacity !== false) {
                    t[r.order.opacity] = '<div class="cp-slider cp-opacity cp-transparency"><span>' + r.labels.opacity + '</span><div class="cp-marker"></div></div>'
                }
                if (r.order.hsl !== false) {
                    t[r.order.hsl] = '<div class="cp-slider cp-hslhue cp-transparency"><span>' + r.labels.hslhue + '</span><div class="cp-marker"></div></div><div class="cp-slider cp-hslsaturation cp-transparency"><span>' + r.labels.hslsaturation + '</span><div class="cp-marker"></div></div><div class="cp-slider cp-hsllightness cp-transparency"><span>' + r.labels.hsllightness + '</span><div class="cp-marker"></div></div>'
                }
                if (r.order.rgb !== false) {
                    t[r.order.rgb] = '<div class="cp-slider cp-rgbred cp-transparency"><span>' + r.labels.rgbred + '</span><div class="cp-marker"></div></div><div class="cp-slider cp-rgbgreen cp-transparency"><span>' + r.labels.rgbgreen + '</span><div class="cp-marker"></div></div><div class="cp-slider cp-rgbblue cp-transparency"><span>' + r.labels.rgbblue + '</span><div class="cp-marker"></div></div>'
                }
                if (r.order.cie !== false) {
                    t[r.order.cie] = '<div class="cp-slider cp-cielightness cp-transparency"><span>' + r.labels.cielightness + '</span><div class="cp-marker"></div></div><div class="cp-slider cp-ciechroma cp-transparency"><span>' + r.labels.ciechroma + '</span><div class="cp-marker"></div></div><div class="cp-slider cp-ciehue cp-transparency"><span>' + r.labels.ciehue + '</span><div class="cp-marker"></div></div>'
                }
                if (r.order.preview !== false) {
                    t[r.order.preview] = '<div class="cp-preview cp-transparency"><input type="text" readonly="readonly"></div>'
                }
                n += '<div class="cp-sliders">';
                for (var o = 0; o < t.length; o++) {
                    if (typeof t[o] === "undefined") {
                        continue
                    }
                    n += t[o]
                }
                n += "</div>";
                if (r.swatches) {
                    n += '<div class="cp-swatches"><button type="button" class="add" title="' + r.titleswatchesadd + '"></button><button type="button" class="remove" title="' + r.titleswatchesremove + '"></button><button type="button" class="reset" title="' + r.titleswatchesreset + '"></button><ul></ul><div style="clear:both"></div></div>'
                }
                if (r.flat) {
                    if (i.is("input")) {
                        s = e('<div class="cp-container"></div>').insertAfter(i)
                    } else {
                        s = e('<div class="cp-container"></div>');
                        i.append(s)
                    }
                } else {
                    s = e('<div class="cp-container"></div>').appendTo("body")
                }
                s.append(n);
                if (r.connectedinput instanceof jQuery) {
                    r.connectedinput.add(i)
                } else if (r.connectedinput === false) {
                    r.connectedinput = i
                } else {
                    r.connectedinput = e(r.connectedinput).add(i)
                }
                if (!r.flat) {
                    s.addClass("cp-popup")
                }
            }

            function b() {
                o = {
                    connectedinput: false,
                    actualswatch: false,
                    swatchescontainer: e(".cp-swatches", s),
                    swatches: e(".cp-swatches ul", s),
                    swatches_add: e(".cp-swatches button.add", s),
                    swatches_remove: e(".cp-swatches button.remove", s),
                    swatches_reset: e(".cp-swatches button.reset", s),
                    all_sliders: e(".cp-sliders, .cp-preview input", s),
                    sliders: {
                        hue: e(".cp-hslhue span", s),
                        hue_marker: e(".cp-hslhue .cp-marker", s),
                        saturation: e(".cp-hslsaturation span", s),
                        saturation_marker: e(".cp-hslsaturation .cp-marker", s),
                        lightness: e(".cp-hsllightness span", s),
                        lightness_marker: e(".cp-hsllightness .cp-marker", s),
                        opacity: e(".cp-opacity span", s),
                        opacity_marker: e(".cp-opacity .cp-marker", s),
                        red: e(".cp-rgbred span", s),
                        red_marker: e(".cp-rgbred .cp-marker", s),
                        green: e(".cp-rgbgreen span", s),
                        green_marker: e(".cp-rgbgreen .cp-marker", s),
                        blue: e(".cp-rgbblue span", s),
                        blue_marker: e(".cp-rgbblue .cp-marker", s),
                        cielightness: e(".cp-cielightness span", s),
                        cielightness_marker: e(".cp-cielightness .cp-marker", s),
                        ciechroma: e(".cp-ciechroma span", s),
                        ciechroma_marker: e(".cp-ciechroma .cp-marker", s),
                        ciehue: e(".cp-ciehue span", s),
                        ciehue_marker: e(".cp-ciehue .cp-marker", s),
                        preview: e(".cp-preview input", s)
                    }
                };
                if (r.connectedinput) {
                    if (r.connectedinput instanceof jQuery) {
                        o.connectedinput = r.connectedinput
                    } else {
                        o.connectedinput = e(r.connectedinput)
                    }
                }
                if (!r.customswatches) {
                    o.swatches_add.hide();
                    o.swatches_remove.hide();
                    o.swatches_reset.hide()
                }
            }

            function w() {
                if (s instanceof jQuery) {
                    m();
                    s.remove();
                    n = false
                }
            }

            function E() {
                p()
            }

            function S() {
                i.on("colorpickersliders.destroy", function () {
                    w()
                });
                i.on("colorpickersliders.reset", function () {
                    E()
                });
                i.on("colorpickersliders.updateColor", function (e, t) {
                    d(t)
                });
                i.on("colorpickersliders.showPopup", function () {
                    v()
                });
                i.on("colorpickersliders.hidePopup", function () {
                    m()
                });
                e(document).on("colorpickersliders.changeswatches", function () {
                    T()
                });
                if (!r.flat && !r.disableautopopup) {
                    if (typeof i.attr("tabindex") === "undefined") {
                        i.attr("tabindex", -1)
                    }
                    if (!i.is("input")) {
                        e(i).on("click", function (e) {
                            v();
                            e.stopPropagation()
                        });
                        e(document).on("click", function () {
                            m()
                        })
                    }
                    e(i).on("focus", function (e) {
                        v();
                        e.stopPropagation()
                    });
                    e(i).on("blur", function (e) {
                        m();
                        e.stopPropagation()
                    });
                    s.on("touchstart mousedown", function (e) {
                        e.preventDefault();
                        e.stopPropagation();
                        return false
                    })
                }
                s.on("contextmenu", function (e) {
                    e.preventDefault();
                    return false
                });
                o.swatches.on("click", "li span", function (t) {
                    var n = e(this).css("background-color");
                    d(n);
                    t.preventDefault()
                });
                o.swatches_add.on("click", function (e) {
                    k();
                    e.preventDefault()
                });
                o.swatches_remove.on("click", function (e) {
                    L();
                    e.preventDefault()
                });
                o.swatches_reset.on("click", function (e) {
                    A();
                    e.preventDefault()
                });
                o.sliders.hue.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "hue";
                    var t = M(f, e);
                    O("hsla", "h", 3.6 * t);
                    P()
                });
                o.sliders.saturation.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "saturation";
                    var t = M(f, e);
                    O("hsla", "s", t / 100);
                    P()
                });
                o.sliders.lightness.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "lightness";
                    var t = M(f, e);
                    O("hsla", "l", t / 100);
                    P()
                });
                o.sliders.opacity.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "opacity";
                    var t = M(f, e);
                    O("hsla", "a", t / 100);
                    P()
                });
                o.sliders.red.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "red";
                    var t = M(f, e);
                    O("rgba", "r", 2.55 * t);
                    P()
                });
                o.sliders.green.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "green";
                    var t = M(f, e);
                    O("rgba", "g", 2.55 * t);
                    P()
                });
                o.sliders.blue.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "blue";
                    var t = M(f, e);
                    O("rgba", "b", 2.55 * t);
                    P()
                });
                o.sliders.cielightness.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "cielightness";
                    var t = M(f, e);
                    O("cielch", "l", a / 100 * t);
                    P()
                });
                o.sliders.ciechroma.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "ciechroma";
                    var t = M(f, e);
                    O("cielch", "c", h / 100 * t);
                    P()
                });
                o.sliders.ciehue.parent().on("touchstart mousedown", function (e) {
                    e.preventDefault();
                    if (e.which > 1) {
                        return
                    }
                    f = "ciehue";
                    var t = M(f, e);
                    O("cielch", "h", 3.6 * t);
                    P()
                });
                o.sliders.preview.on("click", function () {
                    this.select()
                });
                e(document).on("touchmove mousemove", function (e) {
                    if (!f) {
                        return
                    }
                    var t = M(f, e);
                    switch (f) {
                        case"hue":
                            O("hsla", "h", 3.6 * t);
                            break;
                        case"saturation":
                            O("hsla", "s", t / 100);
                            break;
                        case"lightness":
                            O("hsla", "l", t / 100);
                            break;
                        case"opacity":
                            O("hsla", "a", t / 100);
                            break;
                        case"red":
                            O("rgba", "r", 2.55 * t);
                            break;
                        case"green":
                            O("rgba", "g", 2.55 * t);
                            break;
                        case"blue":
                            O("rgba", "b", 2.55 * t);
                            break;
                        case"cielightness":
                            O("cielch", "l", a / 100 * t);
                            break;
                        case"ciechroma":
                            O("cielch", "c", h / 100 * t);
                            break;
                        case"ciehue":
                            O("cielch", "h", 3.6 * t);
                            break
                    }
                    P();
                    e.preventDefault()
                });
                e(document).on("touchend mouseup", function (e) {
                    if (e.which > 1) {
                        return
                    }
                    if (f) {
                        f = false;
                        e.preventDefault()
                    }
                });
                if (o.connectedinput) {
                    o.connectedinput.on("keyup change", function () {
                        var t = e(this);
                        d(t.val(), true)
                    })
                }
            }

            function x() {
                u = [];
                for (var e = 0; e < r.swatches.length; e++) {
                    var t = tinycolor(r.swatches[e]);
                    if (t.format) {
                        u.push(t.toRgbString())
                    }
                }
            }

            function T() {
                if (!r.swatches) {
                    return
                }
                if (r.customswatches) {
                    var t = false;
                    try {
                        t = JSON.parse(localStorage.getItem("swatches-" + r.customswatches))
                    } catch (n) {
                    }
                    if (t) {
                        u = t
                    } else {
                        x()
                    }
                } else {
                    x()
                }
                if (u instanceof Array) {
                    o.swatches.html("");
                    for (var i = 0; i < u.length; i++) {
                        var s = tinycolor(u[i]);
                        if (s.format) {
                            o.swatches.append(e("<li></li>").append(e("<span></span>").css("background-color", s.toRgbString())))
                        }
                    }
                }
                N()
            }

            function N() {
                var t = false;
                e("span", o.swatches).filter(function () {
                    var n = e(this).css("background-color");
                    n = tinycolor(n);
                    n.alpha = Math.round(n.alpha * 100) / 100;
                    if (n.toRgbString() === c.tiny.toRgbString()) {
                        t = true;
                        var r = e(this).parent();
                        if (!r.is(o.actualswatch)) {
                            if (o.actualswatch) {
                                o.actualswatch.removeClass("actual")
                            }
                            o.actualswatch = r;
                            r.addClass("actual")
                        }
                    }
                });
                if (!t) {
                    if (o.actualswatch) {
                        o.actualswatch.removeClass("actual");
                        o.actualswatch = false
                    }
                }
                if (o.actualswatch) {
                    o.swatches_add.prop("disabled", true);
                    o.swatches_remove.prop("disabled", false)
                } else {
                    o.swatches_add.prop("disabled", false);
                    o.swatches_remove.prop("disabled", true)
                }
            }

            function C() {
                localStorage.setItem("swatches-" + r.customswatches, JSON.stringify(u))
            }

            function k() {
                u.unshift(c.tiny.toRgbString());
                C();
                e(document).trigger("colorpickersliders.changeswatches")
            }

            function L() {
                var t = u.indexOf(c.tiny.toRgbString());
                if (t !== -1) {
                    u.splice(t, 1);
                    C();
                    e(document).trigger("colorpickersliders.changeswatches")
                }
            }

            function A() {
                if (confirm("Do you really want to reset the swatches? All customizations will be lost!")) {
                    x();
                    C();
                    e(document).trigger("colorpickersliders.changeswatches")
                }
            }

            function O(t, n, i) {
                switch (t) {
                    case"hsla":
                        c.hsla[n] = i;
                        c.tiny = tinycolor({h: c.hsla.h, s: c.hsla.s, l: c.hsla.l, a: c.hsla.a});
                        c.rgba = c.tiny.toRgb();
                        c.cielch = e.fn.ColorPickerSliders.rgb2lch(c.rgba);
                        s.removeClass("cp-unconvertible-cie-color");
                        break;
                    case"rgba":
                        c.rgba[n] = i;
                        c.tiny = tinycolor({r: c.rgba.r, g: c.rgba.g, b: c.rgba.b, a: c.hsla.a});
                        c.hsla = c.tiny.toHsl();
                        c.cielch = e.fn.ColorPickerSliders.rgb2lch(c.rgba);
                        s.removeClass("cp-unconvertible-cie-color");
                        break;
                    case"cielch":
                        c.cielch[n] = i;
                        c.rgba = e.fn.ColorPickerSliders.lch2rgb(c.cielch);
                        c.tiny = tinycolor(c.rgba);
                        c.hsla = c.tiny.toHsl();
                        if (r.erroneousciecolormarkers) {
                            if (c.rgba.isok) {
                                s.removeClass("cp-unconvertible-cie-color")
                            } else {
                                s.addClass("cp-unconvertible-cie-color")
                            }
                        }
                        break
                }
            }

            function M(t, n) {
                var r = e.fn.ColorPickerSliders.calculateEventPositionPercentage(n, o.sliders[t]);
                o.sliders[t + "_marker"].data("position", r);
                return r
            }

            function D(e) {
                _ = setTimeout(function () {
                    P(e)
                }, r.updateinterval)
            }

            function P(e) {
                clearTimeout(_);
                if (Date.now() - l < r.updateinterval) {
                    D(e);
                    return
                }
                if (typeof e === "undefined") {
                    e = false
                }
                l = Date.now();
                if (r.order.opacity !== false) {
                    I()
                }
                if (r.order.hsl !== false) {
                    B();
                    j();
                    F()
                }
                if (r.order.rgb !== false) {
                    q();
                    R();
                    U()
                }
                if (r.order.cie !== false) {
                    W();
                    X();
                    V()
                }
                if (r.order.preview !== false) {
                    J()
                }
                if (!e) {
                    H()
                }
                if ((100 - c.cielch.l) * c.cielch.a < r.previewcontrasttreshold) {
                    o.all_sliders.css("color", "#000");
                    if (r.previewontriggerelement) {
                        i.css("background", c.tiny.toRgbString()).css("color", "#000")
                    }
                } else {
                    o.all_sliders.css("color", "#fff");
                    if (r.previewontriggerelement) {
                        i.css("background", c.tiny.toRgbString()).css("color", "#fff")
                    }
                }
                N();
                r.onchange(s, c)
            }

            function H() {
                if (o.connectedinput) {
                    o.connectedinput.each(function (t, n) {
                        var r = e(n);
                        switch (r.data("color-format")) {
                            case"hex":
                                r.val(c.tiny.toHexString());
                                break;
                            case"hsl":
                                r.val(c.tiny.toHslString());
                                break;
                            case"rgb":
                            default:
                                r.val(c.tiny.toRgbString());
                                break
                        }
                    })
                }
            }

            function B() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.hue, e.fn.ColorPickerSliders.getScaledGradientStops(c.hsla, "h", 0, 360, 7));
                o.sliders.hue_marker.css("left", c.hsla.h / 360 * 100 + "%")
            }

            function j() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.saturation, e.fn.ColorPickerSliders.getScaledGradientStops(c.hsla, "s", 0, 1, 2));
                o.sliders.saturation_marker.css("left", c.hsla.s * 100 + "%")
            }

            function F() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.lightness, e.fn.ColorPickerSliders.getScaledGradientStops(c.hsla, "l", 0, 1, 3));
                o.sliders.lightness_marker.css("left", c.hsla.l * 100 + "%")
            }

            function I() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.opacity, e.fn.ColorPickerSliders.getScaledGradientStops(c.hsla, "a", 0, 1, 2));
                o.sliders.opacity_marker.css("left", c.hsla.a * 100 + "%")
            }

            function q() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.red, e.fn.ColorPickerSliders.getScaledGradientStops(c.rgba, "r", 0, 255, 2));
                o.sliders.red_marker.css("left", c.rgba.r / 255 * 100 + "%")
            }

            function R() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.green, e.fn.ColorPickerSliders.getScaledGradientStops(c.rgba, "g", 0, 255, 2));
                o.sliders.green_marker.css("left", c.rgba.g / 255 * 100 + "%")
            }

            function U() {
                e.fn.ColorPickerSliders.setGradient(o.sliders.blue, e.fn.ColorPickerSliders.getScaledGradientStops(c.rgba, "b", 0, 255, 2));
                o.sliders.blue_marker.css("left", c.rgba.b / 255 * 100 + "%")
            }

            function z(t, n) {
                if (r.invalidcolorsopacity === 1 || !r.finercierangeedges) {
                    return t
                }
                t.sort(function (e, t) {
                    return e.position - t.position
                });
                var i = [];
                for (var s = 1; s < t.length; s++) {
                    if (t[s].isok !== t[s - 1].isok) {
                        var o = Math.round(t[s].position) - Math.round(t[s - 1].position), u = e.fn.ColorPickerSliders.getScaledGradientStops(t[s].rawcolor, n, t[s - 1].rawcolor[n], t[s].rawcolor[n], o, r.invalidcolorsopacity, t[s - 1].position, t[s].position);
                        for (var a = 0; a < u.length; a++) {
                            if (u[a].isok !== t[s - 1].isok) {
                                i.push(u[a]);
                                if (a > 0) {
                                    i.push(u[a - 1])
                                }
                                break
                            }
                        }
                    }
                }
                return e.merge(i, t)
            }

            function W() {
                var t = e.fn.ColorPickerSliders.getScaledGradientStops(c.cielch, "l", 0, 100, 10, r.invalidcolorsopacity);
                t = z(t, "l");
                e.fn.ColorPickerSliders.setGradient(o.sliders.cielightness, t);
                o.sliders.cielightness_marker.css("left", c.cielch.l / a * 100 + "%")
            }

            function X() {
                var t = e.fn.ColorPickerSliders.getScaledGradientStops(c.cielch, "c", 0, h, 5, r.invalidcolorsopacity);
                t = z(t, "c");
                e.fn.ColorPickerSliders.setGradient(o.sliders.ciechroma, t);
                o.sliders.ciechroma_marker.css("left", c.cielch.c / h * 100 + "%")
            }

            function V() {
                var t = e.fn.ColorPickerSliders.getScaledGradientStops(c.cielch, "h", 0, 360, 28, r.invalidcolorsopacity);
                t = z(t, "h");
                e.fn.ColorPickerSliders.setGradient(o.sliders.ciehue, t);
                o.sliders.ciehue_marker.css("left", c.cielch.h / 360 * 100 + "%")
            }

            function J() {
                o.sliders.preview.css("background", e.fn.ColorPickerSliders.csscolor(c.rgba));
                var t;
                switch (r.previewformat) {
                    case"hex":
                        t = c.tiny.toHexString();
                        break;
                    case"hsl":
                        t = c.tiny.toHslString();
                        break;
                    case"rgb":
                    default:
                        t = c.tiny.toRgbString();
                        break
                }
                o.sliders.preview.val(t)
            }

            var n = false, r, i = e(this), s, o, u, a = 101, f = false, l = 0, c = {
                tiny: null,
                hsla: null,
                rgba: null,
                cielch: null
            }, h = 144;
            p();
            var _
        })
    };
    e.fn.ColorPickerSliders.getEventCoordinates = function (e) {
        if (typeof e.pageX !== "undefined") {
            return {pageX: e.originalEvent.pageX, pageY: e.originalEvent.pageY}
        } else if (typeof e.originalEvent.touches !== "undefined") {
            return {pageX: e.originalEvent.touches[0].pageX, pageY: e.originalEvent.touches[0].pageY}
        }
    };
    e.fn.ColorPickerSliders.calculateEventPositionPercentage = function (t, n) {
        var r = e.fn.ColorPickerSliders.getEventCoordinates(t);
        var i = n.width(), s = r.pageX - n.offset().left;
        var o = s / i * 100;
        if (o < 0) {
            o = 0
        }
        if (o > 100) {
            o = 100
        }
        return o
    };
    e.fn.ColorPickerSliders.gradientSupported = function () {
        var e = document.createElement("detectGradientSupport").style;
        e.backgroundImage = "linear-gradient(left top, #9f9, white)";
        e.backgroundImage = "-o-linear-gradient(left top, #9f9, white)";
        e.backgroundImage = "-moz-linear-gradient(left top, #9f9, white)";
        e.backgroundImage = "-webkit-linear-gradient(left top, #9f9, white)";
        e.backgroundImage = "-ms-linear-gradient(left top, #9f9, white)";
        e.backgroundImage = "-webkit-gradient(linear, left top, right bottom, from(#9f9), to(white))";
        if (e.backgroundImage.indexOf("gradient") === -1) {
            return false
        } else {
            return true
        }
    };
    e.fn.ColorPickerSliders.getScaledGradientStops = function (t, n, r, i, s, o, u, a) {
        if (typeof o === "undefined") {
            o = 1
        }
        if (typeof u === "undefined") {
            u = 0
        }
        if (typeof a === "undefined") {
            a = 100
        }
        var f = [], l = i - r, c = true;
        for (var h = 0; h < s; ++h) {
            var p = h / (s - 1), d = e.fn.ColorPickerSliders.modifyColor(t, n, p * l + r), v;
            if (o < 1) {
                var m = e.fn.ColorPickerSliders.lch2rgb(d, o);
                c = m.isok;
                v = e.fn.ColorPickerSliders.csscolor(m, o)
            } else {
                v = e.fn.ColorPickerSliders.csscolor(d, o)
            }
            f[h] = {color: v, position: p * (a - u) + u, isok: c, rawcolor: d}
        }
        return f
    };
    e.fn.ColorPickerSliders.setGradient = function (e, t) {
        t.sort(function (e, t) {
            return e.position - t.position
        });
        var n = "", r = "", i = "linear-gradient(to right", s = "-webkit-linear-gradient(left", o = "-webkit-gradient(linear, left top, right top";
        for (var u = 0; u < t.length; u++) {
            var a = t[u];
            n += "," + a.color + " " + a.position + "%";
            r += ",color-stop(" + a.position + "%," + a.color + ")"
        }
        n += ")";
        r += ")";
        o += r;
        s += n;
        i += n;
        e.css("background", o);
        e.css("background", s);
        e.css("background", i)
    };
    e.fn.ColorPickerSliders.isGoodRgb = function (e) {
        var t = 258;
        var n = -1;
        if (e.r > t || e.g > t || e.b > t || e.r < n || e.g < n || e.b < n) {
            return false
        } else {
            e.r = Math.min(255, e.r);
            e.g = Math.min(255, e.g);
            e.b = Math.min(255, e.b);
            e.r = Math.max(0, e.r);
            e.g = Math.max(0, e.g);
            e.b = Math.max(0, e.b);
            return true
        }
    };
    e.fn.ColorPickerSliders.rgb2lch = function (t) {
        var n = e.fn.ColorPickerSliders.CIELab2CIELCH(e.fn.ColorPickerSliders.XYZ2CIELab(e.fn.ColorPickerSliders.rgb2XYZ(t)));
        if (t.hasOwnProperty("a")) {
            n.a = t.a
        }
        return n
    };
    e.fn.ColorPickerSliders.lch2rgb = function (t, n) {
        if (typeof n === "undefined") {
            n = 1
        }
        var r = e.fn.ColorPickerSliders.XYZ2rgb(e.fn.ColorPickerSliders.CIELab2XYZ(e.fn.ColorPickerSliders.CIELCH2CIELab(t)));
        if (e.fn.ColorPickerSliders.isGoodRgb(r)) {
            if (t.hasOwnProperty("a")) {
                r.a = t.a
            }
            r.isok = true;
            return r
        }
        var i = e.extend({}, t), s = i.c, o = -1, u = 0;
        do {
            ++u;
            i.c = o + (s - o) / 2;
            r = e.fn.ColorPickerSliders.XYZ2rgb(e.fn.ColorPickerSliders.CIELab2XYZ(e.fn.ColorPickerSliders.CIELCH2CIELab(i)));
            if (e.fn.ColorPickerSliders.isGoodRgb(r)) {
                o = i.c
            } else {
                s = i.c
            }
        } while (Math.abs(s - o) > .9 && u < 100);
        if (t.hasOwnProperty("a")) {
            r.a = t.a
        }
        r.r = Math.max(0, r.r);
        r.g = Math.max(0, r.g);
        r.b = Math.max(0, r.b);
        r.r = Math.min(255, r.r);
        r.g = Math.min(255, r.g);
        r.b = Math.min(255, r.b);
        if (n < 1) {
            if (r.hasOwnProperty("a")) {
                r.a = r.a * n
            } else {
                r.a = n
            }
        }
        r.isok = false;
        return r
    };
    e.fn.ColorPickerSliders.modifyColor = function (t, n, r) {
        var i = e.extend({}, t);
        if (!t.hasOwnProperty(n)) {
            throw"Missing color property: " + n
        }
        i[n] = r;
        return i
    };
    e.fn.ColorPickerSliders.csscolor = function (t, n) {
        if (typeof n === "undefined") {
            n = 1
        }
        var r = false, i = e.extend({}, t);
        if (i.hasOwnProperty("c")) {
            i = e.fn.ColorPickerSliders.lch2rgb(i, n)
        }
        if (i.hasOwnProperty("h")) {
            r = "hsla(" + i.h + "," + i.s * 100 + "%," + i.l * 100 + "%," + i.a + ")"
        }
        if (i.hasOwnProperty("r")) {
            if (i.a < 1) {
                r = "rgba(" + Math.round(i.r) + "," + Math.round(i.g) + "," + Math.round(i.b) + "," + i.a + ")"
            } else {
                r = "rgb(" + Math.round(i.r) + "," + Math.round(i.g) + "," + Math.round(i.b) + ")"
            }
        }
        return r
    };
    e.fn.ColorPickerSliders.rgb2XYZ = function (e) {
        var t = {};
        var n = e.r / 255;
        var r = e.g / 255;
        var i = e.b / 255;
        if (n > .04045) {
            n = Math.pow((n + .055) / 1.055, 2.4)
        } else {
            n = n / 12.92
        }
        if (r > .04045) {
            r = Math.pow((r + .055) / 1.055, 2.4)
        } else {
            r = r / 12.92
        }
        if (i > .04045) {
            i = Math.pow((i + .055) / 1.055, 2.4)
        } else {
            i = i / 12.92
        }
        n = n * 100;
        r = r * 100;
        i = i * 100;
        t.x = n * .4124 + r * .3576 + i * .1805;
        t.y = n * .2126 + r * .7152 + i * .0722;
        t.z = n * .0193 + r * .1192 + i * .9505;
        return t
    };
    e.fn.ColorPickerSliders.XYZ2CIELab = function (e) {
        var t = {};
        var n = e.x / 95.047;
        var r = e.y / 100;
        var i = e.z / 108.883;
        if (n > .008856) {
            n = Math.pow(n, .333333333)
        } else {
            n = 7.787 * n + .137931034
        }
        if (r > .008856) {
            r = Math.pow(r, .333333333)
        } else {
            r = 7.787 * r + .137931034
        }
        if (i > .008856) {
            i = Math.pow(i, .333333333)
        } else {
            i = 7.787 * i + .137931034
        }
        t.l = 116 * r - 16;
        t.a = 500 * (n - r);
        t.b = 200 * (r - i);
        return t
    };
    e.fn.ColorPickerSliders.CIELab2CIELCH = function (e) {
        var t = {};
        t.l = e.l;
        t.c = Math.sqrt(Math.pow(e.a, 2) + Math.pow(e.b, 2));
        t.h = Math.atan2(e.b, e.a);
        if (t.h > 0) {
            t.h = t.h / Math.PI * 180
        } else {
            t.h = 360 - Math.abs(t.h) / Math.PI * 180
        }
        return t
    };
    e.fn.ColorPickerSliders.CIELCH2CIELab = function (e) {
        var t = {};
        t.l = e.l;
        t.a = Math.cos(e.h * .01745329251) * e.c;
        t.b = Math.sin(e.h * .01745329251) * e.c;
        return t
    };
    e.fn.ColorPickerSliders.CIELab2XYZ = function (e) {
        var t = {};
        t.y = (e.l + 16) / 116;
        t.x = e.a / 500 + t.y;
        t.z = t.y - e.b / 200;
        if (Math.pow(t.y, 3) > .008856) {
            t.y = Math.pow(t.y, 3)
        } else {
            t.y = (t.y - .137931034) / 7.787
        }
        if (Math.pow(t.x, 3) > .008856) {
            t.x = Math.pow(t.x, 3)
        } else {
            t.x = (t.x - .137931034) / 7.787
        }
        if (Math.pow(t.z, 3) > .008856) {
            t.z = Math.pow(t.z, 3)
        } else {
            t.z = (t.z - .137931034) / 7.787
        }
        t.x = 95.047 * t.x;
        t.y = 100 * t.y;
        t.z = 108.883 * t.z;
        return t
    };
    e.fn.ColorPickerSliders.XYZ2rgb = function (e) {
        var t = {};
        e.x = e.x / 100;
        e.y = e.y / 100;
        e.z = e.z / 100;
        t.r = e.x * 3.2406 + e.y * -1.5372 + e.z * -.4986;
        t.g = e.x * -.9689 + e.y * 1.8758 + e.z * .0415;
        t.b = e.x * .0557 + e.y * -.204 + e.z * 1.057;
        if (t.r > .0031308) {
            t.r = 1.055 * Math.pow(t.r, .41666667) - .055
        } else {
            t.r = 12.92 * t.r
        }
        if (t.g > .0031308) {
            t.g = 1.055 * Math.pow(t.g, .41666667) - .055
        } else {
            t.g = 12.92 * t.g
        }
        if (t.b > .0031308) {
            t.b = 1.055 * Math.pow(t.b, .41666667) - .055
        } else {
            t.b = 12.92 * t.b
        }
        t.r = Math.round(t.r * 255);
        t.g = Math.round(t.g * 255);
        t.b = Math.round(t.b * 255);
        return t
    }
})(jQuery);

// TinyColor v0.9.16
// https://github.com/bgrins/TinyColor
// 2013-08-10, Brian Grinstead, MIT License
(function () {
    function a(e, t) {
        e = e ? e : "";
        t = t || {};
        if (typeof e == "object" && e.hasOwnProperty("_tc_id")) {
            return e
        }
        var r = f(e);
        var s = r.r, o = r.g, u = r.b, l = r.a, h = i(100 * l) / 100, d = t.format || r.format;
        if (s < 1) {
            s = i(s)
        }
        if (o < 1) {
            o = i(o)
        }
        if (u < 1) {
            u = i(u)
        }
        return {
            ok: r.ok, format: d, _tc_id: n++, alpha: l, getAlpha: function () {
                return l
            }, setAlpha: function (e) {
                l = b(e);
                h = i(100 * l) / 100
            }, toHsv: function () {
                var e = p(s, o, u);
                return {h: e.h * 360, s: e.s, v: e.v, a: l}
            }, toHsvString: function () {
                var e = p(s, o, u);
                var t = i(e.h * 360), n = i(e.s * 100), r = i(e.v * 100);
                return l == 1 ? "hsv(" + t + ", " + n + "%, " + r + "%)" : "hsva(" + t + ", " + n + "%, " + r + "%, " + h + ")"
            }, toHsl: function () {
                var e = c(s, o, u);
                return {h: e.h * 360, s: e.s, l: e.l, a: l}
            }, toHslString: function () {
                var e = c(s, o, u);
                var t = i(e.h * 360), n = i(e.s * 100), r = i(e.l * 100);
                return l == 1 ? "hsl(" + t + ", " + n + "%, " + r + "%)" : "hsla(" + t + ", " + n + "%, " + r + "%, " + h + ")"
            }, toHex: function (e) {
                return v(s, o, u, e)
            }, toHexString: function (e) {
                return "#" + v(s, o, u, e)
            }, toRgb: function () {
                return {r: i(s), g: i(o), b: i(u), a: l}
            }, toRgbString: function () {
                return l == 1 ? "rgb(" + i(s) + ", " + i(o) + ", " + i(u) + ")" : "rgba(" + i(s) + ", " + i(o) + ", " + i(u) + ", " + h + ")"
            }, toPercentageRgb: function () {
                return {r: i(w(s, 255) * 100) + "%", g: i(w(o, 255) * 100) + "%", b: i(w(u, 255) * 100) + "%", a: l}
            }, toPercentageRgbString: function () {
                return l == 1 ? "rgb(" + i(w(s, 255) * 100) + "%, " + i(w(o, 255) * 100) + "%, " + i(w(u, 255) * 100) + "%)" : "rgba(" + i(w(s, 255) * 100) + "%, " + i(w(o, 255) * 100) + "%, " + i(w(u, 255) * 100) + "%, " + h + ")"
            }, toName: function () {
                if (l === 0) {
                    return "transparent"
                }
                return g[v(s, o, u, true)] || false
            }, toFilter: function (e) {
                var n = v(s, o, u);
                var r = n;
                var i = Math.round(parseFloat(l) * 255).toString(16);
                var f = i;
                var c = t && t.gradientType ? "GradientType = 1, " : "";
                if (e) {
                    var h = a(e);
                    r = h.toHex();
                    f = Math.round(parseFloat(h.alpha) * 255).toString(16)
                }
                return "progid:DXImageTransform.Microsoft.gradient(" + c + "startColorstr=#" + N(i) + n + ",endColorstr=#" + N(f) + r + ")"
            }, toString: function (e) {
                var t = !!e;
                e = e || this.format;
                var n = false;
                var r = !t && l < 1 && l > 0;
                var i = r && (e === "hex" || e === "hex6" || e === "hex3" || e === "name");
                if (e === "rgb") {
                    n = this.toRgbString()
                }
                if (e === "prgb") {
                    n = this.toPercentageRgbString()
                }
                if (e === "hex" || e === "hex6") {
                    n = this.toHexString()
                }
                if (e === "hex3") {
                    n = this.toHexString(true)
                }
                if (e === "name") {
                    n = this.toName()
                }
                if (e === "hsl") {
                    n = this.toHslString()
                }
                if (e === "hsv") {
                    n = this.toHsvString()
                }
                if (i) {
                    return this.toRgbString()
                }
                return n || this.toHexString()
            }
        }
    }

    function f(e) {
        var t = {r: 0, g: 0, b: 0};
        var n = 1;
        var r = false;
        var i = false;
        if (typeof e == "string") {
            e = L(e)
        }
        if (typeof e == "object") {
            if (e.hasOwnProperty("r") && e.hasOwnProperty("g") && e.hasOwnProperty("b")) {
                t = l(e.r, e.g, e.b);
                r = true;
                i = String(e.r).substr(-1) === "%" ? "prgb" : "rgb"
            } else if (e.hasOwnProperty("h") && e.hasOwnProperty("s") && e.hasOwnProperty("v")) {
                e.s = C(e.s);
                e.v = C(e.v);
                t = d(e.h, e.s, e.v);
                r = true;
                i = "hsv"
            } else if (e.hasOwnProperty("h") && e.hasOwnProperty("s") && e.hasOwnProperty("l")) {
                e.s = C(e.s);
                e.l = C(e.l);
                t = h(e.h, e.s, e.l);
                r = true;
                i = "hsl"
            }
            if (e.hasOwnProperty("a")) {
                n = e.a
            }
        }
        n = b(n);
        return {ok: r, format: e.format || i, r: s(255, o(t.r, 0)), g: s(255, o(t.g, 0)), b: s(255, o(t.b, 0)), a: n}
    }

    function l(e, t, n) {
        return {r: w(e, 255) * 255, g: w(t, 255) * 255, b: w(n, 255) * 255}
    }

    function c(e, t, n) {
        e = w(e, 255);
        t = w(t, 255);
        n = w(n, 255);
        var r = o(e, t, n), i = s(e, t, n);
        var u, a, f = (r + i) / 2;
        if (r == i) {
            u = a = 0
        } else {
            var l = r - i;
            a = f > .5 ? l / (2 - r - i) : l / (r + i);
            switch (r) {
                case e:
                    u = (t - n) / l + (t < n ? 6 : 0);
                    break;
                case t:
                    u = (n - e) / l + 2;
                    break;
                case n:
                    u = (e - t) / l + 4;
                    break
            }
            u /= 6
        }
        return {h: u, s: a, l: f}
    }

    function h(e, t, n) {
        function o(e, t, n) {
            if (n < 0)n += 1;
            if (n > 1)n -= 1;
            if (n < 1 / 6)return e + (t - e) * 6 * n;
            if (n < 1 / 2)return t;
            if (n < 2 / 3)return e + (t - e) * (2 / 3 - n) * 6;
            return e
        }

        var r, i, s;
        e = w(e, 360);
        t = w(t, 100);
        n = w(n, 100);
        if (t === 0) {
            r = i = s = n
        } else {
            var u = n < .5 ? n * (1 + t) : n + t - n * t;
            var a = 2 * n - u;
            r = o(a, u, e + 1 / 3);
            i = o(a, u, e);
            s = o(a, u, e - 1 / 3)
        }
        return {r: r * 255, g: i * 255, b: s * 255}
    }

    function p(e, t, n) {
        e = w(e, 255);
        t = w(t, 255);
        n = w(n, 255);
        var r = o(e, t, n), i = s(e, t, n);
        var u, a, f = r;
        var l = r - i;
        a = r === 0 ? 0 : l / r;
        if (r == i) {
            u = 0
        } else {
            switch (r) {
                case e:
                    u = (t - n) / l + (t < n ? 6 : 0);
                    break;
                case t:
                    u = (n - e) / l + 2;
                    break;
                case n:
                    u = (e - t) / l + 4;
                    break
            }
            u /= 6
        }
        return {h: u, s: a, v: f}
    }

    function d(e, t, n) {
        e = w(e, 360) * 6;
        t = w(t, 100);
        n = w(n, 100);
        var i = r.floor(e), s = e - i, o = n * (1 - t), u = n * (1 - s * t), a = n * (1 - (1 - s) * t), f = i % 6, l = [n, u, o, o, a, n][f], c = [a, n, n, u, o, o][f], h = [o, o, a, n, n, u][f];
        return {r: l * 255, g: c * 255, b: h * 255}
    }

    function v(e, t, n, r) {
        var s = [N(i(e).toString(16)), N(i(t).toString(16)), N(i(n).toString(16))];
        if (r && s[0].charAt(0) == s[0].charAt(1) && s[1].charAt(0) == s[1].charAt(1) && s[2].charAt(0) == s[2].charAt(1)) {
            return s[0].charAt(0) + s[1].charAt(0) + s[2].charAt(0)
        }
        return s.join("")
    }

    function y(e) {
        var t = {};
        for (var n in e) {
            if (e.hasOwnProperty(n)) {
                t[e[n]] = n
            }
        }
        return t
    }

    function b(e) {
        e = parseFloat(e);
        if (isNaN(e) || e < 0 || e > 1) {
            e = 1
        }
        return e
    }

    function w(e, t) {
        if (x(e)) {
            e = "100%"
        }
        var n = T(e);
        e = s(t, o(0, parseFloat(e)));
        if (n) {
            e = parseInt(e * t, 10) / 100
        }
        if (r.abs(e - t) < 1e-6) {
            return 1
        }
        return e % t / parseFloat(t)
    }

    function E(e) {
        return s(1, o(0, e))
    }

    function S(e) {
        return parseInt(e, 16)
    }

    function x(e) {
        return typeof e == "string" && e.indexOf(".") != -1 && parseFloat(e) === 1
    }

    function T(e) {
        return typeof e === "string" && e.indexOf("%") != -1
    }

    function N(e) {
        return e.length == 1 ? "0" + e : "" + e
    }

    function C(e) {
        if (e <= 1) {
            e = e * 100 + "%"
        }
        return e
    }

    function L(n) {
        n = n.replace(e, "").replace(t, "").toLowerCase();
        var r = false;
        if (m[n]) {
            n = m[n];
            r = true
        } else if (n == "transparent") {
            return {r: 0, g: 0, b: 0, a: 0, format: "name"}
        }
        var i;
        if (i = k.rgb.exec(n)) {
            return {r: i[1], g: i[2], b: i[3]}
        }
        if (i = k.rgba.exec(n)) {
            return {r: i[1], g: i[2], b: i[3], a: i[4]}
        }
        if (i = k.hsl.exec(n)) {
            return {h: i[1], s: i[2], l: i[3]}
        }
        if (i = k.hsla.exec(n)) {
            return {h: i[1], s: i[2], l: i[3], a: i[4]}
        }
        if (i = k.hsv.exec(n)) {
            return {h: i[1], s: i[2], v: i[3]}
        }
        if (i = k.hex6.exec(n)) {
            return {r: S(i[1]), g: S(i[2]), b: S(i[3]), format: r ? "name" : "hex"}
        }
        if (i = k.hex3.exec(n)) {
            return {r: S(i[1] + "" + i[1]), g: S(i[2] + "" + i[2]), b: S(i[3] + "" + i[3]), format: r ? "name" : "hex"}
        }
        return false
    }

    var e = /^[\s,#]+/, t = /\s+$/, n = 0, r = Math, i = r.round, s = r.min, o = r.max, u = r.random;
    a.fromRatio = function (e, t) {
        if (typeof e == "object") {
            var n = {};
            for (var r in e) {
                if (e.hasOwnProperty(r)) {
                    if (r === "a") {
                        n[r] = e[r]
                    } else {
                        n[r] = C(e[r])
                    }
                }
            }
            e = n
        }
        return a(e, t)
    };
    a.equals = function (e, t) {
        if (!e || !t) {
            return false
        }
        return a(e).toRgbString() == a(t).toRgbString()
    };
    a.random = function () {
        return a.fromRatio({r: u(), g: u(), b: u()})
    };
    a.desaturate = function (e, t) {
        t = t === 0 ? 0 : t || 10;
        var n = a(e).toHsl();
        n.s -= t / 100;
        n.s = E(n.s);
        return a(n)
    };
    a.saturate = function (e, t) {
        t = t === 0 ? 0 : t || 10;
        var n = a(e).toHsl();
        n.s += t / 100;
        n.s = E(n.s);
        return a(n)
    };
    a.greyscale = function (e) {
        return a.desaturate(e, 100)
    };
    a.lighten = function (e, t) {
        t = t === 0 ? 0 : t || 10;
        var n = a(e).toHsl();
        n.l += t / 100;
        n.l = E(n.l);
        return a(n)
    };
    a.darken = function (e, t) {
        t = t === 0 ? 0 : t || 10;
        var n = a(e).toHsl();
        n.l -= t / 100;
        n.l = E(n.l);
        return a(n)
    };
    a.complement = function (e) {
        var t = a(e).toHsl();
        t.h = (t.h + 180) % 360;
        return a(t)
    };
    a.triad = function (e) {
        var t = a(e).toHsl();
        var n = t.h;
        return [a(e), a({h: (n + 120) % 360, s: t.s, l: t.l}), a({h: (n + 240) % 360, s: t.s, l: t.l})]
    };
    a.tetrad = function (e) {
        var t = a(e).toHsl();
        var n = t.h;
        return [a(e), a({h: (n + 90) % 360, s: t.s, l: t.l}), a({
            h: (n + 180) % 360,
            s: t.s,
            l: t.l
        }), a({h: (n + 270) % 360, s: t.s, l: t.l})]
    };
    a.splitcomplement = function (e) {
        var t = a(e).toHsl();
        var n = t.h;
        return [a(e), a({h: (n + 72) % 360, s: t.s, l: t.l}), a({h: (n + 216) % 360, s: t.s, l: t.l})]
    };
    a.analogous = function (e, t, n) {
        t = t || 6;
        n = n || 30;
        var r = a(e).toHsl();
        var i = 360 / n;
        var s = [a(e)];
        for (r.h = (r.h - (i * t >> 1) + 720) % 360; --t;) {
            r.h = (r.h + i) % 360;
            s.push(a(r))
        }
        return s
    };
    a.monochromatic = function (e, t) {
        t = t || 6;
        var n = a(e).toHsv();
        var r = n.h, i = n.s, s = n.v;
        var o = [];
        var u = 1 / t;
        while (t--) {
            o.push(a({h: r, s: i, v: s}));
            s = (s + u) % 1
        }
        return o
    };
    a.readability = function (e, t) {
        var n = a(e).toRgb();
        var r = a(t).toRgb();
        var i = (n.r * 299 + n.g * 587 + n.b * 114) / 1e3;
        var s = (r.r * 299 + r.g * 587 + r.b * 114) / 1e3;
        var o = Math.max(n.r, r.r) - Math.min(n.r, r.r) + Math.max(n.g, r.g) - Math.min(n.g, r.g) + Math.max(n.b, r.b) - Math.min(n.b, r.b);
        return {brightness: Math.abs(i - s), color: o}
    };
    a.readable = function (e, t) {
        var n = a.readability(e, t);
        return n.brightness > 125 && n.color > 500
    };
    a.mostReadable = function (e, t) {
        var n = null;
        var r = 0;
        var i = false;
        for (var s = 0; s < t.length; s++) {
            var o = a.readability(e, t[s]);
            var u = o.brightness > 125 && o.color > 500;
            var f = 3 * (o.brightness / 125) + o.color / 500;
            if (u && !i || u && i && f > r || !u && !i && f > r) {
                i = u;
                r = f;
                n = a(t[s])
            }
        }
        return n
    };
    var m = a.names = {
        aliceblue: "f0f8ff",
        antiquewhite: "faebd7",
        aqua: "0ff",
        aquamarine: "7fffd4",
        azure: "f0ffff",
        beige: "f5f5dc",
        bisque: "ffe4c4",
        black: "000",
        blanchedalmond: "ffebcd",
        blue: "00f",
        blueviolet: "8a2be2",
        brown: "a52a2a",
        burlywood: "deb887",
        burntsienna: "ea7e5d",
        cadetblue: "5f9ea0",
        chartreuse: "7fff00",
        chocolate: "d2691e",
        coral: "ff7f50",
        cornflowerblue: "6495ed",
        cornsilk: "fff8dc",
        crimson: "dc143c",
        cyan: "0ff",
        darkblue: "00008b",
        darkcyan: "008b8b",
        darkgoldenrod: "b8860b",
        darkgray: "a9a9a9",
        darkgreen: "006400",
        darkgrey: "a9a9a9",
        darkkhaki: "bdb76b",
        darkmagenta: "8b008b",
        darkolivegreen: "556b2f",
        darkorange: "ff8c00",
        darkorchid: "9932cc",
        darkred: "8b0000",
        darksalmon: "e9967a",
        darkseagreen: "8fbc8f",
        darkslateblue: "483d8b",
        darkslategray: "2f4f4f",
        darkslategrey: "2f4f4f",
        darkturquoise: "00ced1",
        darkviolet: "9400d3",
        deeppink: "ff1493",
        deepskyblue: "00bfff",
        dimgray: "696969",
        dimgrey: "696969",
        dodgerblue: "1e90ff",
        firebrick: "b22222",
        floralwhite: "fffaf0",
        forestgreen: "228b22",
        fuchsia: "f0f",
        gainsboro: "dcdcdc",
        ghostwhite: "f8f8ff",
        gold: "ffd700",
        goldenrod: "daa520",
        gray: "808080",
        green: "008000",
        greenyellow: "adff2f",
        grey: "808080",
        honeydew: "f0fff0",
        hotpink: "ff69b4",
        indianred: "cd5c5c",
        indigo: "4b0082",
        ivory: "fffff0",
        khaki: "f0e68c",
        lavender: "e6e6fa",
        lavenderblush: "fff0f5",
        lawngreen: "7cfc00",
        lemonchiffon: "fffacd",
        lightblue: "add8e6",
        lightcoral: "f08080",
        lightcyan: "e0ffff",
        lightgoldenrodyellow: "fafad2",
        lightgray: "d3d3d3",
        lightgreen: "90ee90",
        lightgrey: "d3d3d3",
        lightpink: "ffb6c1",
        lightsalmon: "ffa07a",
        lightseagreen: "20b2aa",
        lightskyblue: "87cefa",
        lightslategray: "789",
        lightslategrey: "789",
        lightsteelblue: "b0c4de",
        lightyellow: "ffffe0",
        lime: "0f0",
        limegreen: "32cd32",
        linen: "faf0e6",
        magenta: "f0f",
        maroon: "800000",
        mediumaquamarine: "66cdaa",
        mediumblue: "0000cd",
        mediumorchid: "ba55d3",
        mediumpurple: "9370db",
        mediumseagreen: "3cb371",
        mediumslateblue: "7b68ee",
        mediumspringgreen: "00fa9a",
        mediumturquoise: "48d1cc",
        mediumvioletred: "c71585",
        midnightblue: "191970",
        mintcream: "f5fffa",
        mistyrose: "ffe4e1",
        moccasin: "ffe4b5",
        navajowhite: "ffdead",
        navy: "000080",
        oldlace: "fdf5e6",
        olive: "808000",
        olivedrab: "6b8e23",
        orange: "ffa500",
        orangered: "ff4500",
        orchid: "da70d6",
        palegoldenrod: "eee8aa",
        palegreen: "98fb98",
        paleturquoise: "afeeee",
        palevioletred: "db7093",
        papayawhip: "ffefd5",
        peachpuff: "ffdab9",
        peru: "cd853f",
        pink: "ffc0cb",
        plum: "dda0dd",
        powderblue: "b0e0e6",
        purple: "800080",
        red: "f00",
        rosybrown: "bc8f8f",
        royalblue: "4169e1",
        saddlebrown: "8b4513",
        salmon: "fa8072",
        sandybrown: "f4a460",
        seagreen: "2e8b57",
        seashell: "fff5ee",
        sienna: "a0522d",
        silver: "c0c0c0",
        skyblue: "87ceeb",
        slateblue: "6a5acd",
        slategray: "708090",
        slategrey: "708090",
        snow: "fffafa",
        springgreen: "00ff7f",
        steelblue: "4682b4",
        tan: "d2b48c",
        teal: "008080",
        thistle: "d8bfd8",
        tomato: "ff6347",
        turquoise: "40e0d0",
        violet: "ee82ee",
        wheat: "f5deb3",
        white: "fff",
        whitesmoke: "f5f5f5",
        yellow: "ff0",
        yellowgreen: "9acd32"
    };
    var g = a.hexNames = y(m);
    var k = function () {
        var e = "[-\\+]?\\d+%?";
        var t = "[-\\+]?\\d*\\.\\d+%?";
        var n = "(?:" + t + ")|(?:" + e + ")";
        var r = "[\\s|\\(]+(" + n + ")[,|\\s]+(" + n + ")[,|\\s]+(" + n + ")\\s*\\)?";
        var i = "[\\s|\\(]+(" + n + ")[,|\\s]+(" + n + ")[,|\\s]+(" + n + ")[,|\\s]+(" + n + ")\\s*\\)?";
        return {
            rgb: new RegExp("rgb" + r),
            rgba: new RegExp("rgba" + i),
            hsl: new RegExp("hsl" + r),
            hsla: new RegExp("hsla" + i),
            hsv: new RegExp("hsv" + r),
            hex3: /^([0-9a-fA-F]{1})([0-9a-fA-F]{1})([0-9a-fA-F]{1})$/,
            hex6: /^([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/
        }
    }();
    if (typeof module !== "undefined" && module.exports) {
        module.exports = a
    } else if (typeof define !== "undefined") {
        define(function () {
            return a
        })
    } else {
        window.tinycolor = a
    }
})();
/**
 * Wojo Grid
 * */
(function (b, d, c) {
    function a(e, f) {
        this.$el = b(e);
        this.defaults = {inner: 14, outer: 0, mask: 0, cols: 400, curDir: null};
        this.opts = b.extend(this.defaults, f);
        this.init()
    }

    a.prototype.init = function () {
        this.$el.elasticColumns({
            columns: this.getColumnsCount(),
            innerMargin: this.defaults.inner,
            outerMargin: this.defaults.outer,
            hasMask: this.defaults.mask
        });
        this.displayItems();
        b(window).on("resize", b.proxy(this, "onResize"))
    };
    a.prototype.getColumnsCount = function () {
        var f = this.$el.width();
        var g = f;
        var e = 1;
        while (g > this.defaults.cols) {
            e += 1;
            g = f / e
        }
        return e
    };
    a.prototype.onResize = function () {
        this.$el.elasticColumns("refresh");
        this.$el.elasticColumns("set", "columns", this.getColumnsCount())
    };
    a.prototype.onAddNewItems = function (e) {
        this.$el.prepend(e);
        var f = this.$el.children().find("img");
        if (f.length > 0) {
            f.on("load", b.proxy(this, "onNewContentLoaded"));
            f.on("error", b.proxy(this, "onNewContentLoaded"));
            if (this.defaults.mask) {
                this.$el.children().each(function () {
                    $rev = b(this).children(".reveal");
                    $mask = b(this).find(".mask");
                    var g = $rev.height();
                    b($mask).css("height", g)
                })
            }
        } else {
            this.onNewContentLoaded()
        }
    };
    a.prototype.onNewContentLoaded = function () {
        this.$el.elasticColumns("refresh");
        this.displayItems()
    };
    a.prototype.displayItems = function () {
        var e = 0;
        this.$el.children().each(function () {
            b(this).delay(e).hide().fadeIn(600);
            e += 150
        })
    };
    b.fn.Grid = function (e) {
        return this.each(function () {
            new a(this, e)
        })
    }
})(jQuery, document, window);
/*! waitForImages jQuery Plugin 2014-11-14 */
!function (a) {
    var b = "waitForImages";
    a.waitForImages = {
        hasImageProperties: ["backgroundImage", "listStyleImage", "borderImage", "borderCornerImage", "cursor"],
        hasImageAttributes: ["srcset"]
    }, a.expr[":"].uncached = function (b) {
        if (!a(b).is('img[src][src!=""]'))return !1;
        var c = new Image;
        return c.src = b.src, !c.complete
    }, a.fn.waitForImages = function () {
        var c, d, e, f = 0, g = 0, h = a.Deferred();
        if (a.isPlainObject(arguments[0]) ? (e = arguments[0].waitForAll, d = arguments[0].each, c = arguments[0].finished) : 1 === arguments.length && "boolean" === a.type(arguments[0]) ? e = arguments[0] : (c = arguments[0], d = arguments[1], e = arguments[2]), c = c || a.noop, d = d || a.noop, e = !!e, !a.isFunction(c) || !a.isFunction(d))throw new TypeError("An invalid callback was supplied.");
        return this.each(function () {
            var i = a(this), j = [], k = a.waitForImages.hasImageProperties || [], l = a.waitForImages.hasImageAttributes || [], m = /url\(\s*(['"]?)(.*?)\1\s*\)/g;
            e ? i.find("*").addBack().each(function () {
                var b = a(this);
                b.is("img:uncached") && j.push({src: b.attr("src"), element: b[0]}), a.each(k, function (a, c) {
                    var d, e = b.css(c);
                    if (!e)return !0;
                    for (; d = m.exec(e);)j.push({src: d[2], element: b[0]})
                }), a.each(l, function (c, d) {
                    var e, f = b.attr(d);
                    return f ? (e = f.split(","), void a.each(e, function (c, d) {
                        d = a.trim(d).split(" ")[0], j.push({src: d, element: b[0]})
                    })) : !0
                })
            }) : i.find("img:uncached").each(function () {
                j.push({src: this.src, element: this})
            }), f = j.length, g = 0, 0 === f && (c.call(i[0]), h.resolveWith(i[0])), a.each(j, function (e, j) {
                var k = new Image, l = "load." + b + " error." + b;
                a(k).one(l, function m(b) {
                    var e = [g, f, "load" == b.type];
                    return g++, d.apply(j.element, e), h.notifyWith(j.element, e), a(this).off(l, m), g == f ? (c.call(i[0]), h.resolveWith(i[0]), !1) : void 0
                }), k.src = j.src
            })
        }), h.promise()
    }
}(jQuery);
/*
 scrollup v2.3.3
 Author: Mark Goodyear - http://markgoodyear.com
 Git: https://github.com/markgoodyear/scrollup
 */
!function (a, b, c) {
    a.fn.scrollUp = function (b) {
        a.data(c.body, "scrollUp") || (a.data(c.body, "scrollUp", !0), a.fn.scrollUp.init(b))
    }, a.fn.scrollUp.init = function (d) {
        var e, f = a.fn.scrollUp.settings = a.extend({}, a.fn.scrollUp.defaults, d);
        e = f.scrollTrigger ? a(f.scrollTrigger) : a("<a/>", {
            id: f.scrollName,
            href: "#top"
        }), f.scrollTitle && e.attr("title", f.scrollTitle), e.appendTo("body"), f.scrollImg || f.scrollTrigger || e.html(f.scrollText), e.css({
            display: "none",
            position: "fixed",
            zIndex: f.zIndex
        }), f.activeOverlay && a("<div/>", {id: f.scrollName + "-active"}).css({
            position: "absolute",
            top: f.scrollDistance + "px",
            width: "100%",
            borderTop: "1px dotted" + f.activeOverlay,
            zIndex: f.zIndex
        }).appendTo("body");
        var g, h, i, j;
        switch (f.animation) {
            case"fade":
                g = "fadeIn", h = "fadeOut", i = f.animationSpeed;
                break;
            case"slide":
                g = "slideDown", h = "slideUp", i = f.animationSpeed;
                break;
            default:
                g = "show", h = "hide", i = 0
        }
        j = "top" === f.scrollFrom ? f.scrollDistance : a(c).height() - a(b).height() - f.scrollDistance;
        var k = !1;
        scrollEvent = a(b).scroll(function () {
            a(b).scrollTop() > j ? k || (e[g](i), k = !0) : k && (e[h](i), k = !1)
        });
        var l;
        f.scrollTarget ? "number" == typeof f.scrollTarget ? l = f.scrollTarget : "string" == typeof f.scrollTarget && (l = Math.floor(a(f.scrollTarget).offset().top)) : l = 0, e.click(function (b) {
            b.preventDefault(), a("html, body").animate({scrollTop: l}, f.scrollSpeed, f.easingType)
        })
    }, a.fn.scrollUp.defaults = {
        scrollName: "scrollUp",
        scrollDistance: 300,
        scrollFrom: "top",
        scrollSpeed: 300,
        easingType: "linear",
        animation: "fade",
        animationSpeed: 200,
        scrollTrigger: !1,
        scrollTarget: !1,
        scrollText: "",
        scrollTitle: !1,
        scrollImg: !1,
        activeOverlay: !1,
        zIndex: 2147483647
    }, a.fn.scrollUp.destroy = function (d) {
        a.removeData(c.body, "scrollUp"), a("#" + a.fn.scrollUp.settings.scrollName).remove(), a("#" + a.fn.scrollUp.settings.scrollName + "-active").remove(), a.fn.jquery.split(".")[1] >= 7 ? a(b).off("scroll", d) : a(b).unbind("scroll", d)
    }, a.scrollUp = a.fn.scrollUp
}(jQuery, window, document);
/*! SmartMenus jQuery Plugin - v0.9.6 - March 27, 2014
 * http://www.smartmenus.org/
 * Copyright 2014 Vasil Dinkov, Vadikom Web Ltd. http://vadikom.com; Licensed MIT */
(function (t) {
    function s(s) {
        if (h || s)h && s && (t(document).unbind(".smartmenus_mouse"), h = !1); else {
            var e = !0, o = null;
            t(document).bind({
                "mousemove.smartmenus_mouse": function (s) {
                    var a = {x: s.pageX, y: s.pageY, timeStamp: (new Date).getTime()};
                    if (o) {
                        var r = Math.abs(o.x - a.x), h = Math.abs(o.y - a.y);
                        if ((r > 0 || h > 0) && 2 >= r && 2 >= h && 300 >= a.timeStamp - o.timeStamp && (n = !0, e)) {
                            var u = t(s.target).closest("a");
                            u.is("a") && t.each(i, function () {
                                return t.contains(this.$root[0], u[0]) ? (this.itemEnter({currentTarget: u[0]}), !1) : void 0
                            }), e = !1
                        }
                    }
                    o = a
                },
                "touchstart.smartmenus_mouse pointerover.smartmenus_mouse MSPointerOver.smartmenus_mouse": function (t) {
                    /^(4|mouse)$/.test(t.originalEvent.pointerType) || (n = !1)
                }
            }), h = !0
        }
    }

    var i = [], e = !!window.createPopup, o = e && !document.defaultView, a = e && !document.querySelector, r = e && document.documentElement.currentStyle.minWidth === void 0, n = !1, h = !1;
    t.SmartMenus = function (s, i) {
        this.$root = t(s), this.opts = i, this.rootId = "", this.$subArrow = null, this.subMenus = [], this.activatedItems = [], this.visibleSubMenus = [], this.showTimeout = 0, this.hideTimeout = 0, this.scrollTimeout = 0, this.clickActivated = !1, this.zIndexInc = 0, this.$firstLink = null, this.$firstSub = null, this.disabled = !1, this.$disableOverlay = null, this.init()
    }, t.extend(t.SmartMenus, {
        hideAll: function () {
            t.each(i, function () {
                this.menuHideAll()
            })
        }, destroy: function () {
            for (; i.length;)i[0].destroy();
            s(!0)
        }, prototype: {
            init: function (e) {
                var o = this;
                if (!e) {
                    i.push(this), this.rootId = ((new Date).getTime() + Math.random() + "").replace(/\D/g, ""), this.$root.hasClass("sm-rtl") && (this.opts.rightToLeftSubMenus = !0), this.$root.data("smartmenus", this).attr("data-smartmenus-id", this.rootId).dataSM("level", 1).bind({
                        "mouseover.smartmenus focusin.smartmenus": t.proxy(this.rootOver, this),
                        "mouseout.smartmenus focusout.smartmenus": t.proxy(this.rootOut, this)
                    }).delegate("a", {
                        "mouseenter.smartmenus": t.proxy(this.itemEnter, this),
                        "mouseleave.smartmenus": t.proxy(this.itemLeave, this),
                        "mousedown.smartmenus": t.proxy(this.itemDown, this),
                        "focus.smartmenus": t.proxy(this.itemFocus, this),
                        "blur.smartmenus": t.proxy(this.itemBlur, this),
                        "click.smartmenus": t.proxy(this.itemClick, this),
                        "touchend.smartmenus": t.proxy(this.itemTouchEnd, this)
                    });
                    var a = ".smartmenus" + this.rootId;
                    this.opts.hideOnClick && t(document).bind("touchstart" + a, t.proxy(this.docTouchStart, this)).bind("touchmove" + a, t.proxy(this.docTouchMove, this)).bind("touchend" + a, t.proxy(this.docTouchEnd, this)).bind("click" + a, t.proxy(this.docClick, this)), t(window).bind("resize" + a + " orientationchange" + a, t.proxy(this.winResize, this)), this.opts.subIndicators && (this.$subArrow = t("<span/>").addClass("sub-arrow"), this.opts.subIndicatorsText && this.$subArrow.html(this.opts.subIndicatorsText)), s()
                }
                if (this.$firstSub = this.$root.find("ul").each(function () {
                        o.menuInit(t(this))
                    }).eq(0), this.$firstLink = this.$root.find("a").eq(0), this.opts.markCurrentItem) {
                    var r = /(index|default)\.[^#\?\/]*/i, n = /#.*/, h = window.location.href.replace(r, ""), u = h.replace(n, "");
                    this.$root.find("a").each(function () {
                        var s = this.href.replace(r, ""), i = t(this);
                        (s == h || s == u) && (i.addClass("current"), o.opts.markCurrentTree && i.parents("li").each(function () {
                            var s = t(this);
                            s.dataSM("sub") && s.children("a").addClass("current")
                        }))
                    })
                }
            }, destroy: function () {
                this.menuHideAll(), this.$root.removeData("smartmenus").removeAttr("data-smartmenus-id").removeDataSM("level").unbind(".smartmenus").undelegate(".smartmenus");
                var s = ".smartmenus" + this.rootId;
                t(document).unbind(s), t(window).unbind(s), this.opts.subIndicators && (this.$subArrow = null);
                var e = this;
                t.each(this.subMenus, function () {
                    this.hasClass("mega-menu") && this.find("ul").removeDataSM("in-mega"), this.dataSM("shown-before") && (a && this.children().css({
                        styleFloat: "",
                        width: ""
                    }), (e.opts.subMenusMinWidth || e.opts.subMenusMaxWidth) && (r ? this.css({
                        width: "",
                        overflowX: "",
                        overflowY: ""
                    }).children().children("a").css("white-space", "") : this.css({
                        width: "",
                        minWidth: "",
                        maxWidth: ""
                    }).removeClass("sm-nowrap")), this.dataSM("scroll-arrows") && this.dataSM("scroll-arrows").remove(), this.css({
                        zIndex: "",
                        top: "",
                        left: "",
                        marginLeft: "",
                        marginTop: "",
                        display: ""
                    })), e.opts.subIndicators && this.dataSM("parent-a").removeClass("has-submenu").children("span.sub-arrow").remove(), this.removeDataSM("shown-before").removeDataSM("ie-shim").removeDataSM("scroll-arrows").removeDataSM("parent-a").removeDataSM("level").removeDataSM("beforefirstshowfired").parent().removeDataSM("sub")
                }), this.opts.markCurrentItem && this.$root.find("a.current").removeClass("current"), this.$root = null, this.$firstLink = null, this.$firstSub = null, this.$disableOverlay && (this.$disableOverlay.remove(), this.$disableOverlay = null), i.splice(t.inArray(this, i), 1)
            }, disable: function (s) {
                if (!this.disabled) {
                    if (this.menuHideAll(), !s && !this.opts.isPopup && this.$root.is(":visible")) {
                        var i = this.$root.offset();
                        this.$disableOverlay = t('<div class="sm-jquery-disable-overlay"/>').css({
                            position: "absolute",
                            top: i.top,
                            left: i.left,
                            width: this.$root.outerWidth(),
                            height: this.$root.outerHeight(),
                            zIndex: this.getStartZIndex() + 1,
                            opacity: 0
                        }).appendTo(document.body)
                    }
                    this.disabled = !0
                }
            }, docClick: function (s) {
                (this.visibleSubMenus.length && !t.contains(this.$root[0], s.target) || t(s.target).is("a")) && this.menuHideAll()
            }, docTouchEnd: function () {
                if (this.lastTouch) {
                    if (!(!this.visibleSubMenus.length || void 0 !== this.lastTouch.x2 && this.lastTouch.x1 != this.lastTouch.x2 || void 0 !== this.lastTouch.y2 && this.lastTouch.y1 != this.lastTouch.y2 || this.lastTouch.target && t.contains(this.$root[0], this.lastTouch.target))) {
                        this.hideTimeout && (clearTimeout(this.hideTimeout), this.hideTimeout = 0);
                        var s = this;
                        this.hideTimeout = setTimeout(function () {
                            s.menuHideAll()
                        }, 350)
                    }
                    this.lastTouch = null
                }
            }, docTouchMove: function (t) {
                if (this.lastTouch) {
                    var s = t.originalEvent.touches[0];
                    this.lastTouch.x2 = s.pageX, this.lastTouch.y2 = s.pageY
                }
            }, docTouchStart: function (t) {
                var s = t.originalEvent.touches[0];
                this.lastTouch = {x1: s.pageX, y1: s.pageY, target: s.target}
            }, enable: function () {
                this.disabled && (this.$disableOverlay && (this.$disableOverlay.remove(), this.$disableOverlay = null), this.disabled = !1)
            }, getHeight: function (t) {
                return this.getOffset(t, !0)
            }, getOffset: function (t, s) {
                var i;
                "none" == t.css("display") && (i = {
                    position: t[0].style.position,
                    visibility: t[0].style.visibility
                }, t.css({position: "absolute", visibility: "hidden"}).show());
                var e = t[0].ownerDocument.defaultView, o = e && e.getComputedStyle && e.getComputedStyle(t[0], null), a = o && parseFloat(o[s ? "height" : "width"]);
                return a ? a += parseFloat(o[s ? "paddingTop" : "paddingLeft"]) + parseFloat(o[s ? "paddingBottom" : "paddingRight"]) + parseInt(o[s ? "borderTopWidth" : "borderLeftWidth"]) + parseInt(o[s ? "borderBottomWidth" : "borderRightWidth"]) : a = s ? t[0].offsetHeight : t[0].offsetWidth, i && t.hide().css(i), a
            }, getWidth: function (t) {
                return this.getOffset(t)
            }, getStartZIndex: function () {
                var t = parseInt(this.$root.css("z-index"));
                return isNaN(t) ? 1 : t
            }, handleEvents: function () {
                return !this.disabled && this.isCSSOn()
            }, handleItemEvents: function (t) {
                return this.handleEvents() && !this.isLinkInMegaMenu(t)
            }, isCollapsible: function () {
                return "static" == this.$firstSub.css("position")
            }, isCSSOn: function () {
                return "block" == this.$firstLink.css("display")
            }, isFixed: function () {
                return "fixed" == this.$root.css("position")
            }, isLinkInMegaMenu: function (t) {
                return !t.parent().parent().dataSM("level")
            }, isTouchMode: function () {
                return !n || this.isCollapsible()
            }, itemActivate: function (s) {
                var i = s.parent(), e = i.parent(), o = e.dataSM("level");
                if (o > 1 && (!this.activatedItems[o - 2] || this.activatedItems[o - 2][0] != e.dataSM("parent-a")[0])) {
                    var a = this;
                    t(e.parentsUntil("[data-smartmenus-id]", "ul").get().reverse()).add(e).each(function () {
                        a.itemActivate(t(this).dataSM("parent-a"))
                    })
                }
                if (this.visibleSubMenus.length > o)for (var r = this.visibleSubMenus.length - 1, n = this.activatedItems[o - 1] && this.activatedItems[o - 1][0] == s[0] ? o : o - 1; r > n; r--)this.menuHide(this.visibleSubMenus[r]);
                if (this.activatedItems[o - 1] = s, this.visibleSubMenus[o - 1] = e, this.$root.triggerHandler("activate.smapi", s[0]) !== !1) {
                    var h = i.dataSM("sub");
                    h && (this.isTouchMode() || !this.opts.showOnClick || this.clickActivated) && this.menuShow(h)
                }
            }, itemBlur: function (s) {
                var i = t(s.currentTarget);
                this.handleItemEvents(i) && this.$root.triggerHandler("blur.smapi", i[0])
            }, itemClick: function (s) {
                var i = t(s.currentTarget);
                if (this.handleItemEvents(i)) {
                    if (i.removeDataSM("mousedown"), this.$root.triggerHandler("click.smapi", i[0]) === !1)return !1;
                    var e = i.parent().dataSM("sub");
                    if (this.isTouchMode()) {
                        if (i.dataSM("href") && i.attr("href", i.dataSM("href")).removeDataSM("href"), e && (!e.dataSM("shown-before") || !e.is(":visible")) && (this.itemActivate(i), e.is(":visible")))return !1
                    } else if (this.opts.showOnClick && 1 == i.parent().parent().dataSM("level") && e)return this.clickActivated = !0, this.menuShow(e), !1;
                    return i.hasClass("disabled") ? !1 : this.$root.triggerHandler("select.smapi", i[0]) === !1 ? !1 : void 0
                }
            }, itemDown: function (s) {
                var i = t(s.currentTarget);
                this.handleItemEvents(i) && i.dataSM("mousedown", !0)
            }, itemEnter: function (s) {
                var i = t(s.currentTarget);
                if (this.handleItemEvents(i)) {
                    if (!this.isTouchMode()) {
                        this.showTimeout && (clearTimeout(this.showTimeout), this.showTimeout = 0);
                        var e = this;
                        this.showTimeout = setTimeout(function () {
                            e.itemActivate(i)
                        }, this.opts.showOnClick && 1 == i.parent().parent().dataSM("level") ? 1 : this.opts.showTimeout)
                    }
                    this.$root.triggerHandler("mouseenter.smapi", i[0])
                }
            }, itemFocus: function (s) {
                var i = t(s.currentTarget);
                this.handleItemEvents(i) && (this.isTouchMode() && i.dataSM("mousedown") || this.activatedItems.length && this.activatedItems[this.activatedItems.length - 1][0] == i[0] || this.itemActivate(i), this.$root.triggerHandler("focus.smapi", i[0]))
            }, itemLeave: function (s) {
                var i = t(s.currentTarget);
                this.handleItemEvents(i) && (this.isTouchMode() || (i[0].blur && i[0].blur(), this.showTimeout && (clearTimeout(this.showTimeout), this.showTimeout = 0)), i.removeDataSM("mousedown"), this.$root.triggerHandler("mouseleave.smapi", i[0]))
            }, itemTouchEnd: function (s) {
                var i = t(s.currentTarget);
                if (this.handleItemEvents(i)) {
                    var e = i.parent().dataSM("sub");
                    "#" === i.attr("href").charAt(0) || !e || e.dataSM("shown-before") && e.is(":visible") || (i.dataSM("href", i.attr("href")), i.attr("href", "#"))
                }
            }, menuFixLayout: function (t) {
                t.dataSM("shown-before") || (t.hide().dataSM("shown-before", !0), a && t.children().css({
                    styleFloat: "left",
                    width: "100%"
                }))
            }, menuHide: function (t) {
                if (this.$root.triggerHandler("beforehide.smapi", t[0]) !== !1 && (t.stop(!0, !0), t.is(":visible"))) {
                    var s = function () {
                        o ? t.parent().css("z-index", "") : t.css("z-index", "")
                    };
                    this.isCollapsible() ? this.opts.collapsibleHideFunction ? this.opts.collapsibleHideFunction.call(this, t, s) : t.hide(this.opts.collapsibleHideDuration, s) : this.opts.hideFunction ? this.opts.hideFunction.call(this, t, s) : t.hide(this.opts.hideDuration, s), t.dataSM("ie-shim") && t.dataSM("ie-shim").remove(), t.dataSM("scroll") && t.unbind(".smartmenus_scroll").removeDataSM("scroll").dataSM("scroll-arrows").hide(), t.dataSM("parent-a").removeClass("highlighted");
                    var i = t.dataSM("level");
                    this.activatedItems.splice(i - 1, 1), this.visibleSubMenus.splice(i - 1, 1), this.$root.triggerHandler("hide.smapi", t[0])
                }
            }, menuHideAll: function () {
                this.showTimeout && (clearTimeout(this.showTimeout), this.showTimeout = 0);
                for (var t = this.visibleSubMenus.length - 1; t > 0; t--)this.menuHide(this.visibleSubMenus[t]);
                this.opts.isPopup && (this.$root.stop(!0, !0), this.$root.is(":visible") && (this.opts.hideFunction ? this.opts.hideFunction.call(this, this.$root) : this.$root.hide(this.opts.hideDuration), this.$root.dataSM("ie-shim") && this.$root.dataSM("ie-shim").remove())), this.activatedItems = [], this.visibleSubMenus = [], this.clickActivated = !1, this.zIndexInc = 0
            }, menuIframeShim: function (s) {
                e && this.opts.overlapControlsInIE && !s.dataSM("ie-shim") && s.dataSM("ie-shim", t("<iframe/>").attr({
                    src: "javascript:0",
                    tabindex: -9
                }).css({position: "absolute", top: "auto", left: "0", opacity: 0, border: "0"}))
            }, menuInit: function (t) {
                if (!t.dataSM("in-mega")) {
                    this.subMenus.push(t), t.hasClass("mega-menu") && t.find("ul").dataSM("in-mega", !0);
                    for (var s = 2, i = t[0]; (i = i.parentNode.parentNode) != this.$root[0];)s++;
                    t.dataSM("parent-a", t.prevAll("a").eq(-1)).dataSM("level", s).parent().dataSM("sub", t), this.opts.subIndicators && t.dataSM("parent-a").addClass("has-submenu")[this.opts.subIndicatorsPos](this.$subArrow.clone())
                }
            }, menuPosition: function (s) {
                var i, e, o = s.dataSM("parent-a"), a = s.parent().parent(), r = s.dataSM("level"), h = this.getWidth(s), u = this.getHeight(s), l = o.offset(), d = l.left, c = l.top, m = this.getWidth(o), p = this.getHeight(o), f = t(window), v = f.scrollLeft(), b = f.scrollTop(), M = f.width(), S = f.height(), w = a.hasClass("sm") && !a.hasClass("sm-vertical"), g = 2 == r ? this.opts.mainMenuSubOffsetX : this.opts.subMenusSubOffsetX, T = 2 == r ? this.opts.mainMenuSubOffsetY : this.opts.subMenusSubOffsetY;
                if (w ? (i = this.opts.rightToLeftSubMenus ? m - h - g : g, e = this.opts.bottomToTopSubMenus ? -u - T : p + T) : (i = this.opts.rightToLeftSubMenus ? g - h : m - g, e = this.opts.bottomToTopSubMenus ? p - T - u : T), this.opts.keepInViewport && !this.isCollapsible()) {
                    this.isFixed() && (d -= v, c -= b, v = b = 0);
                    var $ = d + i, I = c + e;
                    if (this.opts.rightToLeftSubMenus && v > $ ? i = w ? v - $ + i : m - g : !this.opts.rightToLeftSubMenus && $ + h > v + M && (i = w ? v + M - h - $ + i : g - h), w || (S > u && I + u > b + S ? e += b + S - u - I : (u >= S || b > I) && (e += b - I)), n && (w && (I + u > b + S + .49 || b > I) || !w && u > S + .49)) {
                        var y = this;
                        s.dataSM("scroll-arrows") || s.dataSM("scroll-arrows", t([t('<span class="scroll-up"><span class="scroll-up-arrow"></span></span>')[0], t('<span class="scroll-down"><span class="scroll-down-arrow"></span></span>')[0]]).bind({
                            mouseenter: function () {
                                y.menuScroll(s, t(this).hasClass("scroll-up"))
                            }, mouseleave: function (t) {
                                y.menuScrollStop(s), y.menuScrollOut(s, t)
                            }, "mousewheel DOMMouseScroll": function (t) {
                                t.preventDefault()
                            }
                        }).insertAfter(s));
                        var x = b - (c + p);
                        s.dataSM("scroll", {
                            vportY: x,
                            subH: u,
                            winH: S,
                            step: 1
                        }).bind({
                            "mouseover.smartmenus_scroll": function (t) {
                                y.menuScrollOver(s, t)
                            }, "mouseout.smartmenus_scroll": function (t) {
                                y.menuScrollOut(s, t)
                            }, "mousewheel.smartmenus_scroll DOMMouseScroll.smartmenus_scroll": function (t) {
                                y.menuScrollMousewheel(s, t)
                            }
                        }).dataSM("scroll-arrows").css({
                            top: "auto",
                            left: "0",
                            marginLeft: i + (parseInt(s.css("border-left-width")) || 0),
                            width: this.getWidth(s) - (parseInt(s.css("border-left-width")) || 0) - (parseInt(s.css("border-right-width")) || 0),
                            zIndex: this.getStartZIndex() + this.zIndexInc
                        }).eq(0).css("margin-top", x).end().eq(1).css("margin-top", x + S - this.getHeight(s.dataSM("scroll-arrows").eq(1))).end().eq(w && this.opts.bottomToTopSubMenus ? 0 : 1).show()
                    }
                }
                s.css({
                    top: "auto",
                    left: "0",
                    marginLeft: i,
                    marginTop: e - p
                }), this.menuIframeShim(s), s.dataSM("ie-shim") && s.dataSM("ie-shim").css({
                    zIndex: s.css("z-index"),
                    width: h,
                    height: u,
                    marginLeft: i,
                    marginTop: e - p
                })
            }, menuScroll: function (t, s, i) {
                var e = parseFloat(t.css("margin-top")), o = t.dataSM("scroll"), a = o.vportY + (s ? 0 : o.winH - o.subH), r = i || !this.opts.scrollAccelerate ? this.opts.scrollStep : Math.floor(t.dataSM("scroll").step);
                if (t.add(t.dataSM("ie-shim")).css("margin-top", Math.abs(a - e) > r ? e + (s ? r : -r) : a), e = parseFloat(t.css("margin-top")), (s && e + o.subH > o.vportY + o.winH || !s && o.vportY > e) && t.dataSM("scroll-arrows").eq(s ? 1 : 0).show(), !i && this.opts.scrollAccelerate && t.dataSM("scroll").step < this.opts.scrollStep && (t.dataSM("scroll").step += .5), 1 > Math.abs(e - a))t.dataSM("scroll-arrows").eq(s ? 0 : 1).hide(), t.dataSM("scroll").step = 1; else if (!i) {
                    var n = this;
                    this.scrollTimeout = setTimeout(function () {
                        n.menuScroll(t, s)
                    }, this.opts.scrollInterval)
                }
            }, menuScrollMousewheel: function (s, i) {
                for (var e = t(i.target).closest("ul"); e.dataSM("in-mega");)e = e.parent().closest("ul");
                if (e[0] == s[0]) {
                    var o = (i.originalEvent.wheelDelta || -i.originalEvent.detail) > 0;
                    s.dataSM("scroll-arrows").eq(o ? 0 : 1).is(":visible") && this.menuScroll(s, o, !0)
                }
                i.preventDefault()
            }, menuScrollOut: function (s, i) {
                for (var e = /^scroll-(up|down)/, o = t(i.relatedTarget).closest("ul"); o.dataSM("in-mega");)o = o.parent().closest("ul");
                e.test((i.relatedTarget || "").className) || (s[0] == i.relatedTarget || t.contains(s[0], i.relatedTarget)) && o[0] == s[0] || s.dataSM("scroll-arrows").css("visibility", "hidden")
            }, menuScrollOver: function (s, i) {
                for (var e = /^scroll-(up|down)/, o = t(i.target).closest("ul"); o.dataSM("in-mega");)o = o.parent().closest("ul");
                e.test(i.target.className) || o[0] != s[0] || s.dataSM("scroll-arrows").css("visibility", "visible")
            }, menuScrollStop: function (t) {
                this.scrollTimeout && (clearTimeout(this.scrollTimeout), this.scrollTimeout = 0, t.dataSM("scroll").step = 1)
            }, menuShow: function (t) {
                if ((t.dataSM("beforefirstshowfired") || (t.dataSM("beforefirstshowfired", !0), this.$root.triggerHandler("beforefirstshow.smapi", t[0]) !== !1)) && this.$root.triggerHandler("beforeshow.smapi", t[0]) !== !1 && (this.menuFixLayout(t), t.stop(!0, !0), !t.is(":visible"))) {
                    var s = this.getStartZIndex() + ++this.zIndexInc;
                    if (o ? t.parent().css("z-index", s) : t.css("z-index", s), (this.opts.keepHighlighted || this.isCollapsible()) && t.dataSM("parent-a").addClass("highlighted"), this.opts.subMenusMinWidth || this.opts.subMenusMaxWidth)if (a) {
                        if (t.children().css("styleFloat", "none"), r ? t.width(this.opts.subMenusMinWidth ? this.opts.subMenusMinWidth : 1).children().children("a").css("white-space", "nowrap") : (t.css({
                                width: "auto",
                                minWidth: "",
                                maxWidth: ""
                            }).addClass("sm-nowrap"), this.opts.subMenusMinWidth && t.css("min-width", this.opts.subMenusMinWidth)), this.opts.subMenusMaxWidth) {
                            var i = t.width();
                            if (r) {
                                var e = t.css({
                                    width: this.opts.subMenusMaxWidth,
                                    overflowX: "hidden",
                                    overflowY: "hidden"
                                }).width();
                                i > e ? t.css({
                                    width: e,
                                    overflowX: "visible",
                                    overflowY: "visible"
                                }).children().children("a").css("white-space", "") : t.css({
                                    width: i,
                                    overflowX: "visible",
                                    overflowY: "visible"
                                })
                            } else t.css("max-width", this.opts.subMenusMaxWidth), i > t.width() ? t.removeClass("sm-nowrap").css("width", this.opts.subMenusMaxWidth) : t.width(i)
                        } else t.width(t.width());
                        t.children().css("styleFloat", "left")
                    } else if (t.css({
                            width: "auto",
                            minWidth: "",
                            maxWidth: ""
                        }).addClass("sm-nowrap"), this.opts.subMenusMinWidth && t.css("min-width", this.opts.subMenusMinWidth), this.opts.subMenusMaxWidth) {
                        var i = this.getWidth(t);
                        t.css("max-width", this.opts.subMenusMaxWidth), i > this.getWidth(t) && t.removeClass("sm-nowrap").css("width", this.opts.subMenusMaxWidth)
                    }
                    this.menuPosition(t), t.dataSM("ie-shim") && t.dataSM("ie-shim").insertBefore(t);
                    var n = function () {
                        t.css("overflow", "")
                    };
                    this.isCollapsible() ? this.opts.collapsibleShowFunction ? this.opts.collapsibleShowFunction.call(this, t, n) : t.show(this.opts.collapsibleShowDuration, n) : this.opts.showFunction ? this.opts.showFunction.call(this, t, n) : t.show(this.opts.showDuration, n), this.visibleSubMenus[t.dataSM("level") - 1] = t, this.$root.triggerHandler("show.smapi", t[0])
                }
            }, popupHide: function (t) {
                this.hideTimeout && (clearTimeout(this.hideTimeout), this.hideTimeout = 0);
                var s = this;
                this.hideTimeout = setTimeout(function () {
                    s.menuHideAll()
                }, t ? 1 : this.opts.hideTimeout)
            }, popupShow: function (t, s) {
                return this.opts.isPopup ? (this.hideTimeout && (clearTimeout(this.hideTimeout), this.hideTimeout = 0), this.menuFixLayout(this.$root), this.$root.stop(!0, !0), this.$root.is(":visible") || (this.$root.css({
                    left: t,
                    top: s
                }), this.menuIframeShim(this.$root), this.$root.dataSM("ie-shim") && this.$root.dataSM("ie-shim").css({
                    zIndex: this.$root.css("z-index"),
                    width: this.getWidth(this.$root),
                    height: this.getHeight(this.$root),
                    left: t,
                    top: s
                }).insertBefore(this.$root), this.opts.showFunction ? this.opts.showFunction.call(this, this.$root) : this.$root.show(this.opts.showDuration), this.visibleSubMenus[0] = this.$root), void 0) : (alert('SmartMenus jQuery Error:\n\nIf you want to show this menu via the "popupShow" method, set the isPopup:true option.'), void 0)
            }, refresh: function () {
                this.menuHideAll(), this.$root.find("ul").each(function () {
                    var s = t(this);
                    s.dataSM("scroll-arrows") && s.dataSM("scroll-arrows").remove()
                }).removeDataSM("in-mega").removeDataSM("shown-before").removeDataSM("ie-shim").removeDataSM("scroll-arrows").removeDataSM("parent-a").removeDataSM("level").removeDataSM("beforefirstshowfired"), this.$root.find("a.has-submenu").removeClass("has-submenu").parent().removeDataSM("sub"), this.opts.subIndicators && this.$root.find("span.sub-arrow").remove(), this.opts.markCurrentItem && this.$root.find("a.current").removeClass("current"), this.subMenus = [], this.init(!0)
            }, rootOut: function (t) {
                if (this.handleEvents() && !this.isTouchMode() && t.target != this.$root[0] && (this.hideTimeout && (clearTimeout(this.hideTimeout), this.hideTimeout = 0), !this.opts.showOnClick || !this.opts.hideOnClick)) {
                    var s = this;
                    this.hideTimeout = setTimeout(function () {
                        s.menuHideAll()
                    }, this.opts.hideTimeout)
                }
            }, rootOver: function (t) {
                this.handleEvents() && !this.isTouchMode() && t.target != this.$root[0] && this.hideTimeout && (clearTimeout(this.hideTimeout), this.hideTimeout = 0)
            }, winResize: function (t) {
                if (this.handleEvents())this.isCollapsible() || "onorientationchange" in window && "orientationchange" != t.type || (this.activatedItems.length && this.activatedItems[this.activatedItems.length - 1][0].blur(), this.menuHideAll()); else if (this.$disableOverlay) {
                    var s = this.$root.offset();
                    this.$disableOverlay.css({
                        top: s.top,
                        left: s.left,
                        width: this.$root.outerWidth(),
                        height: this.$root.outerHeight()
                    })
                }
            }
        }
    }), t.fn.dataSM = function (t, s) {
        return s ? this.data(t + "_smartmenus", s) : this.data(t + "_smartmenus")
    }, t.fn.removeDataSM = function (t) {
        return this.removeData(t + "_smartmenus")
    }, t.fn.smartmenus = function (s) {
        if ("string" == typeof s) {
            var i = arguments, e = s;
            return Array.prototype.shift.call(i), this.each(function () {
                var s = t(this).data("smartmenus");
                s && s[e] && s[e].apply(s, i)
            })
        }
        var o = t.extend({}, t.fn.smartmenus.defaults, s);
        return this.each(function () {
            new t.SmartMenus(this, o)
        })
    }, t.fn.smartmenus.defaults = {
        isPopup: !1,
        mainMenuSubOffsetX: 0,
        mainMenuSubOffsetY: 0,
        subMenusSubOffsetX: 0,
        subMenusSubOffsetY: 0,
        subMenusMinWidth: "10em",
        subMenusMaxWidth: "20em",
        subIndicators: !0,
        subIndicatorsPos: "prepend",
        subIndicatorsText: "+",
        scrollStep: 30,
        scrollInterval: 30,
        scrollAccelerate: !0,
        showTimeout: 250,
        hideTimeout: 500,
        showDuration: 0,
        showFunction: null,
        hideDuration: 0,
        hideFunction: function (t, s) {
            t.fadeOut(200, s)
        },
        collapsibleShowDuration: 0,
        collapsibleShowFunction: function (t, s) {
            t.slideDown(200, s)
        },
        collapsibleHideDuration: 0,
        collapsibleHideFunction: function (t, s) {
            t.slideUp(200, s)
        },
        showOnClick: !1,
        hideOnClick: !0,
        keepInViewport: !0,
        keepHighlighted: !0,
        markCurrentItem: !1,
        markCurrentTree: !0,
        rightToLeftSubMenus: !1,
        bottomToTopSubMenus: !1,
        overlapControlsInIE: !0
    }
})(jQuery);
/**
 * jQuery Grid-A-Licious(tm) v3.01
 *
 * Terms of Use - jQuery Grid-A-Licious(tm)
 * under the MIT (http://www.opensource.org/licenses/mit-license.php) License.
 *
 */
(function (a, b) {
    var c = function (a, b, c) {
        var d;
        return function () {
            function h() {
                if (!c)a.apply(f, g);
                d = null
            }

            var f = this, g = arguments;
            if (d)clearTimeout(d); else if (c)a.apply(f, g);
            d = setTimeout(h, b || 150)
        }
    };
    jQuery.fn[b] = function (a) {
        return a ? this.bind("resize", c(a)) : this.trigger(b)
    }
})(jQuery, "smartresize");
(function (a) {
    a.Gal = function (b, c) {
        this.element = a(c);
        this._init(b)
    };
    a.Gal.settings = {
        selector: ".item",
        width: 225,
        gutter: 20,
        animate: false,
        animationOptions: {
            speed: 200, duration: 300, effect: "fadeInOnAppear", queue: true, complete: function () {
            }
        }
    };
    a.Gal.prototype = {
        _init: function (b) {
            var c = this;
            this.name = this._setName(5);
            this.gridArr = [];
            this.gridArrAppend = [];
            this.gridArrPrepend = [];
            this.setArr = false;
            this.setGrid = false;
            this.setOptions;
            this.cols = 0;
            this.itemCount = 0;
            this.prependCount = 0;
            this.isPrepending = false;
            this.appendCount = 0;
            this.resetCount = true;
            this.ifCallback = true;
            this.box = this.element;
            this.options = a.extend(true, {}, a.Gal.settings, b);
            this.gridArr = a.makeArray(this.box.find(this.options.selector));
            this.isResizing = false;
            this.w = 0;
            this.boxArr = [];
            this._setCols();
            this._renderGrid("append");
            a(this.box).addClass("gridalicious");
            a(window).smartresize(function () {
                c.resize()
            })
        }, _setName: function (a, b) {
            b = b ? b : "";
            return a ? this._setName(--a, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz".charAt(Math.floor(Math.random() * 60)) + b) : b
        }, _setCols: function () {
            this.cols = Math.floor(this.box.width() / this.options.width);
            diff = (this.box.width() - this.cols * this.options.width - this.options.gutter) / this.cols;
            w = (this.options.width + diff) / this.box.width() * 100;
            this.w = w;
            for (var b = 0; b < this.cols; b++) {
                var c = a("<div></div>").addClass("galcolumn").attr("id", "item" + b + this.name).css({
                    width: w + "%",
                    paddingLeft: this.options.gutter,
                    paddingBottom: this.options.gutter,
                    "float": "left",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "-o-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                this.box.append(c)
            }
            this.box.find(a("#clear" + this.name)).remove();
            var d = a("<div></div>").css({
                clear: "both",
                height: "0",
                width: "0",
                display: "block"
            }).attr("id", "clear" + this.name);
            this.box.append(d)
        }, _renderGrid: function (b, c, d, e) {
            var f = [];
            var g = [];
            var h = [];
            var i = 0;
            var j = this.prependCount;
            var k = this.appendCount;
            var l = this.options.gutter;
            var m = this.cols;
            var n = this.name;
            var o = 0;
            var p = a(".galcolumn").width();
            if (c) {
                g = c;
                if (b == "append") {
                    k += d;
                    i = this.appendCount
                }
                if (b == "prepend") {
                    this.isPrepending = true;
                    i = Math.round(d % m);
                    if (i <= 0)i = m
                }
                if (b == "renderAfterPrepend") {
                    k += d;
                    i = d
                }
            } else {
                g = this.gridArr;
                k = a(this.gridArr).size()
            }
            a.each(g, function (c, d) {
                var e = a(d);
                var g = "100%";
                if (e.hasClass("not-responsive")) {
                    g = "auto"
                }
                e.css({
                    marginBottom: l,
                    zoom: "1",
                    filter: "alpha(opacity=0)",
                    opacity: "0"
                }).find("img, object, embed, iframe").css({
                    maxWidth: g,
                    height: "auto",
                    display: "block",
                    "margin-left": "auto",
                    "margin-right": "auto"
                });
                if (b == "prepend") {
                    i--;
                    a("#item" + i + n).prepend(e);
                    f.push(e);
                    if (i == 0)i = m
                } else {
                    a("#item" + i + n).append(e);
                    f.push(e);
                    i++;
                    if (i >= m)i = 0;
                    if (k >= m)k = k - m
                }
            });
            this.appendCount = k;
            this.itemCount = i;
            if (b == "append" || b == "prepend") {
                if (b == "prepend") {
                    this._updateAfterPrepend(this.gridArr, g)
                }
                this._renderItem(f);
                this.isPrepending = false
            } else {
                this._renderItem(this.gridArr)
            }
        }, _collectItems: function () {
            var b = [];
            a(this.box).find(this.options.selector).each(function (c) {
                b.push(a(this))
            });
            return b
        }, _renderItem: function (b) {
            var c = this.options.animationOptions.speed;
            var d = this.options.animationOptions.effect;
            var e = this.options.animationOptions.duration;
            var f = this.options.animationOptions.queue;
            var g = this.options.animate;
            var h = this.options.animationOptions.complete;
            var i = 0;
            var j = 0;
            if (g === true && !this.isResizing) {
                if (f === true && d == "fadeInOnAppear") {
                    if (this.isPrepending)b.reverse();
                    a.each(b, function (d, f) {
                        setTimeout(function () {
                            a(f).animate({opacity: "1.0"}, e);
                            j++;
                            if (j == b.length) {
                                h.call(undefined, b)
                            }
                        }, i * c);
                        i++
                    })
                } else if (f === false && d == "fadeInOnAppear") {
                    if (this.isPrepending)b.reverse();
                    a.each(b, function (c, d) {
                        a(d).animate({opacity: "1.0"}, e);
                        j++;
                        if (j == b.length) {
                            if (this.ifCallback) {
                                h.call(undefined, b)
                            }
                        }
                    })
                }
                if (f === true && !d) {
                    a.each(b, function (c, d) {
                        a(d).css({opacity: "1", filter: "alpha(opacity=1)"});
                        j++;
                        if (j == b.length) {
                            if (this.ifCallback) {
                                h.call(undefined, b)
                            }
                        }
                    })
                }
            } else {
                a.each(b, function (b, c) {
                    a(c).css({opacity: "1", filter: "alpha(opacity=1)"})
                });
                if (this.ifCallback) {
                    h.call(b)
                }
            }
        }, _updateAfterPrepend: function (b, c) {
            var d = this.gridArr;
            a.each(c, function (a, b) {
                d.unshift(b)
            });
            this.gridArr = d
        }, resize: function () {
            this.box.find(a(".galcolumn")).remove();
            this._setCols();
            this.ifCallback = false;
            this.isResizing = true;
            this._renderGrid("append");
            this.ifCallback = true;
            this.isResizing = false
        }, append: function (b) {
            var c = this.gridArr;
            var d = this.gridArrPrepend;
            a.each(b, function (a, b) {
                c.push(b);
                d.push(b)
            });
            this._renderGrid("append", b, a(b).size())
        }, prepend: function (b) {
            this.ifCallback = false;
            this._renderGrid("prepend", b, a(b).size());
            this.ifCallback = true
        }
    };
    a.fn.gridalicious = function (b, c) {
        if (typeof b === "string") {
            this.each(function () {
                var d = a.data(this, "gridalicious");
                d[b].apply(d, [c])
            })
        } else {
            this.each(function () {
                a.data(this, "gridalicious", new a.Gal(b, this))
            })
        }
        return this
    }
})(jQuery);