# JFDataTransfer
1. UIPasteboard
   使用很简单，请参考API

2.Keychain
Keychain 介绍
Keychain Services 是 OS X 和 iOS 都提供一种安全地存储敏感信息的工具，比如，存储用户ID，密码，和证书等。存储这些信息可以免除用户重复输入用户名和密码的过程。Keychain Services 的安全机制保证了存储这些敏感信息不会被窃取。简单说来，Keychain 就是一个安全容器。

Keychain 的结构
Keychain 可以包含任意数量的 keychain item。每一个 keychain item 包含数据和一组属性。对于一个需要保护的 keychain item，比如密码或者私钥（用于加密或者解密的string字节）数据是加密的，会被 keychain 保护起来的；对于无需保护的 keychain item，例如，证书，数据未被加密。

跟keychain item有关系的取决于item的类型；应用程序中最常用的是网络密码（Internet passwrods）和普通的密码。正如你所想的，网络密码像安全域（security domain）、协议、和路径等一些属性。在OSX中，当keychain被锁的时候加密的item没办法访问，如果你想要该问被锁的item，就会弹出一个对话框，需要你输入对应keychain的密码。当然，未有密码的keychain你可以随时访问。但在iOS中，你只可以访问你自已的keychain items;

item可以指定为以下的类型： 
extern CFTypeRef kSecClassGenericPassword
extern CFTypeRef kSecClassInternetPassword
extern CFTypeRef kSecClassCertificate
extern CFTypeRef kSecClassKey
extern CFTypeRef kSecClassIdentity OSX_AVAILABLE_STARTING(MAC_10_7, __IPHONE_2_0);

Keychain的使用
大多数iOS应用需要用到Keychain， 都用来添加一个密码，修改一个已存在Keychain item或者取回密码。Keychain提供了以下的操作

SecItemAdd 添加一个item 

SecItemUpdate 更新已存在的item 

SecItemCopyMatching 搜索一个已存在的item 

SecItemDelete 删除一个keychain item 


Keychain 共享数据
先开启Keychain share,选中项目的Target -> Capabilities -> Keychain Groups。打开这个选项。

同时在你的项目会生成一个entitlements文件。里面会有Access group，在我的项目中的值是

$(AppIdentifierPrefix)com.jf.JFDataTransfer

AppIdentifierPrefix表示发布者的一个身份，这个可以在苹果开发者后台可以找得到。
可以从在Info.plist文件中新增一组key-value
Key: AppIdentifierPrefix
Value: $(AppIdentifierPrefix)

最后创建Keychain Item的时候，需要指定的相应的group
NSString *perfix = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"AppIdentifierPrefix"];
NSString *groupString = [NSString stringWithFormat:@"%@com.jf.JFDataTransfer",perfix];
[keyChainQueryDictaionary setObject:groupString forKey:(id)kSecAttrAccessGroup];
在其他需要共享数据的应用也是重复以上的操作，不过得保证AppIdentifierPrefix相同。
且两个项目必须在同一个appid下，否则会找不到而报错

3.UIDocumentInteractionController
UIDocumentInteractionController是从ios 3.2的sdk开始支持的，他是直接继承自NSObject，因此需要UIDocumentInteractionController提供的方法来展示他，UIDocumentInteractionController主要给我们提供了三种用途：
1 展示一个可以操作我们分享的文档类型的第三方App列表
2 在第一条展示列表的基础上添加额外的操作，比如复制，打印，预览，保存等。
3 结合Quick Look框架直接展示文档内容

##初始化
 UIDocumentInteractionController *documentController = [UIDocumentInteractionController interactionControllerWithURL:[[NSBundle mainBundle] URLForResource:@"MyFile" withExtension:@"pdf"]];
##实现一个UIDocumentInteractionController的方法：
- (BOOL)presentOpenInMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;

##调用之处
UIDocumentInteractionController *documentController = [UIDocumentInteractionController interactionControllerWithURL:[[NSBundle mainBundle] URLForResource:@"111" withExtension:@"pdf"]];
self.document = documentController;
[self.document presentOpenInMenuFromRect:self.view.bounds inView:self.view animated:YES];

值得注意的是这里的document 使用了全局变量，因为在ARC下面方法结束之后documentController 被释放，没有效果展示。

以上文档请参考范例：https://github.com/thomas0326/JFDataTransfer








